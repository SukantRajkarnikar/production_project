import 'package:flutter/material.dart';
import 'package:production_project/anim/anim_scale_transition.dart';
import 'package:production_project/common_models/furniture_model.dart';
import 'package:production_project/di/service_locator.dart';
import 'package:production_project/feature/categories/screens/categories_screen.dart';
import 'package:production_project/feature/components/common_vertical_product_component.dart';
import 'package:production_project/feature/home/screens/home_viewmodel.dart';
import 'package:production_project/feature/rooms/model/rooms_model.dart';
import 'package:production_project/feature/rooms/screens/room_result_screen.dart';
import 'package:production_project/feature/rooms/screens/rooms_screen.dart';
import 'package:production_project/feature/search/screens/search_screen.dart';
import 'package:production_project/utils/colors.dart';
import 'package:production_project/utils/dimens.dart';
import 'package:production_project/utils/image_constants.dart';
import 'package:production_project/utils/navigator_drawer_component.dart';
import 'package:production_project/utils/strings.dart';
import 'package:production_project/utils/text_styles.dart';
import 'package:production_project/utils/utils.dart';
import 'package:production_project/utils/widget_functions.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel viewModel = locator<HomeViewModel>();
  final TextEditingController _searchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() {}

  final List<FurnitureModel> furnitures = [
    FurnitureModel(
        id: 1,
        title: "Lorem Ipsum asdbga asjdbas asjdhajs asjdha",
        category: "category",
        price: 20000.0,
        desc:
            "hjasbdnba asdhajhnsbd asdhhas dasd asdbas duiqawh asuidbas dasud ajns dihahs djhka sjdn aiyhksdioa sdjb auiysd asjhbdnma sd jha sdbjha sjh d",
        rooms: ["Room 1, Room 2"],
        imageNames: []),
    FurnitureModel(
        id: 2,
        title: "Lorem Ipsum 2",
        category: "category2",
        price: 10000.0,
        desc:
            "hjasbdnba asdhajhnsbd asdhhas dasd asdbas duiqawh asuidbas dasud ajns dihahs djhka sjdn aiyhksdioa sdjb auiysd asjhbdnma sd jha sdbjha sjh d",
        rooms: [],
        imageNames: []),
    FurnitureModel(
        id: 3,
        title: "Lorem Ipsum 3",
        category: "category2",
        price: 10000.0,
        desc:
            "hjasbdnba asdhajhnsbd asdhhas dasd asdbas duiqawh asuidbas dasud ajns dihahs djhka sjdn aiyhksdioa sdjb auiysd asjhbdnma sd jha sdbjha sjh d",
        rooms: [],
        imageNames: []),
  ];

  final List<RoomModel> rooms = [
    RoomModel(
        id: 1,
        title: Strings.livingRoom,
        imageName: ImageConstants.IC_SORT_BY_ROOMS_LIVING_ROOM),
    RoomModel(
        id: 1,
        title: Strings.diningRoom,
        imageName: ImageConstants.IC_SORT_BY_ROOMS_DINING_ROOM),
    RoomModel(
        id: 1,
        title: Strings.bedRoom,
        imageName: ImageConstants.IC_SORT_BY_ROOMS_BED_ROOM),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (BuildContext context) => viewModel,
      child: Scaffold(
        drawer: const NavigatorDrawerComponent(),
        appBar: _appBar(),
        body: Container(
          color: const AppColors().backGroundColor,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(Dimens.spacing_16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  _searchTextFieldComponent(),
                  addVerticalSpace(Dimens.spacing_16),
                  _bannerComponent(ImageConstants.IC_Banner_1),
                  addVerticalSpace(Dimens.spacing_24),
                  const Text(
                    Strings.featuredProducts,
                    style: text_7b44c0_14_Medium_w600,
                  ),
                  addVerticalSpace(Dimens.spacing_16),
                  _productHorizontalListViewComponent(Strings.featuredProducts),
                  addVerticalSpace(Dimens.spacing_24),
                  _bannerComponent(ImageConstants.IC_Banner_2),
                  addVerticalSpace(Dimens.spacing_24),
                  const Text(
                    Strings.ourNewReleases,
                    style: text_7b44c0_14_Medium_w600,
                  ),
                  addVerticalSpace(Dimens.spacing_16),
                  _productHorizontalListViewComponent(Strings.ourNewReleases),
                  addVerticalSpace(Dimens.spacing_24),
                  const Text(
                    Strings.viewByRoom,
                    style: text_7b44c0_14_Medium_w600,
                  ),
                  addVerticalSpace(Dimens.spacing_16),
                  // Test2(),
                  _viewByRoomComponent(rooms),
                  addVerticalSpace(18),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: AppColors.white_rbga_ffffff,
      elevation: 0,
      title: const Text(
        Strings.home,
        style: text_1f2024_14_Bold_w800,
      ),
      leading: Builder(builder: (context) {
        return IconButton(
          icon: Image.asset(
            ImageConstants.IC_HAMBURGER_MENU_ICON,
            width: Dimens.spacing_20,
            height: Dimens.spacing_20,
            color: AppColors.black_rgba_1f2024,
          ),
          onPressed: () {
            Scaffold.of(context).openDrawer();//todo cxheck
          },
        );
      }),
    );
  }

  Widget _searchTextFieldComponent() {
    return TextFormField(
      onTap: () {
        Navigator.push(context, AnimScaleTransition(page: const SearchScreen()));
      },
      readOnly: true,
      style: text_1f2024_14_Regular_w400,
      controller: _searchTextController,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsetsDirectional.only(start: 12, end: 16),
          child: Image.asset(
            ImageConstants.IC_SEARCH_ICON,
            width: 8,
            height: 8,
            color: AppColors.black_rgba_8F9098,
          ),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        hintText: Strings.search,
        hintStyle: text_8f9098_14_Regular_w400,
        filled: true,
        fillColor: const Color.fromRGBO(255, 255, 255, 1),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color.fromRGBO(197, 198, 204, 1)),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFF006FFD)),
            borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  Widget _bannerComponent(String image) {
    return Center(
      child: ClipRRect(
          borderRadius: BorderRadius.circular(Dimens.spacing_12),
          child: Image.asset(image)),
    );
  }

  Widget _productHorizontalListViewComponent(String type) {
    switch (type) {
      case Strings.featuredProducts:
        return SizedBox(
          height: 270,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: furnitures.length,
            itemBuilder: (BuildContext context, int index) {
              return CommonVerticalProductComponent(
                furnitureModel: furnitures[index],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return addHorizontalSpace(Dimens.spacing_16);
            },
          ),
        );
      case Strings.ourNewReleases:
        return SizedBox(
          height: 270,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: furnitures.length,
            itemBuilder: (BuildContext context, int index) {
              return OnClickWidget(
                onClick: () {
                  debugPrint("hiiii");
                },
                child: CommonVerticalProductComponent(
                  furnitureModel: furnitures[index],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return addHorizontalSpace(Dimens.spacing_16);
            },
          ),
        );
      default:
        return Container();
    }
  }

  Widget _viewByRoomComponent(List<RoomModel> roomList) {
    return Center(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent:
              ((MediaQuery.of(context).size.width - Dimens.spacing_48) / 2) *
                  (3 / 5),
          mainAxisSpacing: Dimens.spacing_6,
          crossAxisSpacing: Dimens.spacing_8,
        ),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: roomList.length,
        itemBuilder: (BuildContext context, int index) {
          return _roomGridComponent(roomList[index]);
        },
      ),
    );
  }

  Widget _roomGridComponent(RoomModel model) {
    return OnClickWidget(
      onClick: () {
        Navigator.push(
            context, AnimScaleTransition(page: RoomResultScreen(roomName: model.title)));
      },
      child: Card(
        child: Stack(
          fit: StackFit.expand,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(Dimens.spacing_12),
              child: Image.asset(
                model.imageName,
                fit: BoxFit.cover,
              ),
            ),
            Center(
                child: Padding(
                    padding: const EdgeInsets.all(Dimens.spacing_8),
                    child: Text(
                      model.title,
                      style: text_ffffff_16_Bold_w700,
                      textAlign: TextAlign.center,
                    ))),
          ],
        ),
      ),
    );
  }
}