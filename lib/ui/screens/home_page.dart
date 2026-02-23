import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/main.dart';
import 'package:flutter_onboarding/models/plants.dart';
import 'package:flutter_onboarding/ui/screens/detail_page.dart';
import 'package:flutter_onboarding/ui/screens/widgets/plant_widget.dart';
import 'package:page_transition/page_transition.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  String _searchQuery = '';
  int _selectedCategoryIndex = 0;
  bool _isRecommendationBarVisible = true;

  List<String> get _plantTypes => [
    getLocalizedText('recommended'),
    getLocalizedText('indoor'),
    getLocalizedText('outdoor'),
    getLocalizedText('garden'),
    getLocalizedText('supplement'),
  ];

  static const List<String> _plantTypeFilterKeys = [
    'Recommended',
    'Indoor',
    'Outdoor',
    'Garden',
    'Supplement',
  ];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    localeNotifier.addListener(_onLocaleChange);
  }

  void _onLocaleChange() => setState(() {});

  void _onScroll() {
    if (_scrollController.offset > 50 && _isRecommendationBarVisible) {
      setState(() {
        _isRecommendationBarVisible = false;
      });
    } else if (_scrollController.offset <= 50 && !_isRecommendationBarVisible) {
      setState(() {
        _isRecommendationBarVisible = true;
      });
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    localeNotifier.removeListener(_onLocaleChange);
    super.dispose();
  }

  List<Plant> _getFilteredPlants(List<Plant> plantList) {
    String selectedCategory = _plantTypeFilterKeys[_selectedCategoryIndex];

    List<Plant> categoryFiltered = selectedCategory == 'Recommended'
        ? plantList
        : plantList.where((plant) =>
            plant.category.toLowerCase() == selectedCategory.toLowerCase()
          ).toList();

    if (_searchQuery.isEmpty) return categoryFiltered;
    return categoryFiltered.where((plant) =>
        plant.plantName.toLowerCase().contains(_searchQuery.toLowerCase()) ||
        plant.category.toLowerCase().contains(_searchQuery.toLowerCase())
      ).toList();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Plant> _filteredPlants = _getFilteredPlants(Plant.plantList);

    return Scaffold(
        body: SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ),
                  width: size.width * .9,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.search,
                        color: Theme.of(context).textTheme.bodyLarge?.color?.withOpacity(.6),
                      ),
                      Expanded(
                          child: TextField(
                        controller: _searchController,
                        onChanged: (value) {
                          setState(() {
                            _searchQuery = value;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: getLocalizedText('searchPlant'),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      )),
                      _searchQuery.isNotEmpty
                          ? IconButton(
                              icon: const Icon(Icons.clear),
                              color: Theme.of(context).textTheme.bodyLarge?.color?.withOpacity(.6),
                              onPressed: () {
                                setState(() {
                                  _searchController.clear();
                                  _searchQuery = '';
                                });
                              },
                            )
                          : Icon(
                              Icons.mic,
                              color: Theme.of(context).textTheme.bodyLarge?.color?.withOpacity(.6),
                            ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Constants.primaryColor.withOpacity(.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                )
              ],
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: _isRecommendationBarVisible ? 50.0 : 0.0,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: _isRecommendationBarVisible ? 1.0 : 0.0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                height: 50.0,
                width: size.width,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _plantTypes.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedCategoryIndex = index;
                            });
                          },
                          child: AnimatedDefaultTextStyle(
                            duration: const Duration(milliseconds: 300),
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: _selectedCategoryIndex == index
                                  ? FontWeight.bold
                                  : FontWeight.w300,
                              color: _selectedCategoryIndex == index
                                  ? Constants.primaryColor
                                  : Theme.of(context).textTheme.bodyLarge?.color,
                            ),
                            child: Text(_plantTypes[index]),
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: SizedBox(
              key: ValueKey<int>(_selectedCategoryIndex),
              height: size.height * .3,
              child: _filteredPlants.isEmpty
                  ? Center(
                      child: Text(
                        getLocalizedText('noPlantsFound'),
                        style: TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color?.withOpacity(0.5)),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _filteredPlants.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return TweenAnimationBuilder<double>(
                          tween: Tween(begin: 0.0, end: 1.0),
                          duration: Duration(milliseconds: 300 + (index * 100)),
                          builder: (context, value, child) {
                            return Opacity(
                              opacity: value,
                              child: Transform.translate(
                                offset: Offset(0, 20 * (1 - value)),
                                child: child,
                              ),
                            );
                          },
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      child: DetailPage(
                                        plantId: _filteredPlants[index].plantId,
                                      ),
                                      type: PageTransitionType.bottomToTop));
                            },
                            child: Container(
                              width: 200,
                              margin: const EdgeInsets.symmetric(horizontal: 10),
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 10,
                                    right: 20,
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _filteredPlants[index].isFavorated = !_filteredPlants[index].isFavorated;
                                          });
                                        },
                                        icon: AnimatedSwitcher(
                                          duration: const Duration(milliseconds: 300),
                                          child: Icon(
                                            _filteredPlants[index].isFavorated == true
                                                ? Icons.favorite
                                                : Icons.favorite_border,
                                            key: ValueKey<bool>(_filteredPlants[index].isFavorated),
                                            color: Constants.primaryColor,
                                          ),
                                        ),
                                        iconSize: 30,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 50,
                                    right: 50,
                                    top: 50,
                                    bottom: 50,
                                    child: Image.asset(_filteredPlants[index].imageURL),
                                  ),
                                  Positioned(
                                    bottom: 15,
                                    left: 20,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          _filteredPlants[index].category,
                                          style: const TextStyle(
                                            color: Colors.white70,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Text(
                                          _filteredPlants[index].plantName,
                                          style: const TextStyle(
                                            color: Colors.white70,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 15,
                                    right: 20,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 2),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        r'$' + _filteredPlants[index].price.toString(),
                                        style: TextStyle(
                                            color: Constants.primaryColor,
                                            fontSize: 16),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                color: Constants.primaryColor.withOpacity(.8),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        );
                      }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 20, top: 20),
            child: Text(
              getLocalizedText('newPlants'),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: SizedBox(
              height: size.height * .5,
              child: _filteredPlants.isEmpty
                  ? null
                  : ListView.builder(
                    itemCount: _filteredPlants.length,
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return TweenAnimationBuilder<double>(
                        tween: Tween(begin: 0.0, end: 1.0),
                        duration: Duration(milliseconds: 300 + (index * 50)),
                        builder: (context, value, child) {
                          return Opacity(
                            opacity: value,
                            child: Transform.translate(
                              offset: Offset(30 * (1 - value), 0),
                              child: child,
                            ),
                          );
                        },
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(context, PageTransition(child: DetailPage(plantId: _filteredPlants[index].plantId), type: PageTransitionType.bottomToTop));
                            },
                            child: PlantWidget(index: index, plantList: _filteredPlants)),
                      );
                    }),
            ),
          ),
        ],
      ),
    ));
  }
}
