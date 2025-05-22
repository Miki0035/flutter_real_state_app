import 'package:real_state_app/features/home/models/apartment_model.dart';
import 'package:real_state_app/utilis/constants/images.dart';

final List<ApartmentModel> dummyApartments = [
  ApartmentModel(
    image: MImage.newYork,
    apartmentName: "Merialla Villa",
    location: "New York, US",
    rating: 3.0,
    price: 1222,
    type: Type.house,
  ),
  ApartmentModel(
    image: MImage.japan,
    apartmentName: "Modernica Apartement",
    location: "New York, US",
    rating: 3.8,
    price: 1500,
    type: Type.villa,
  ),
  ApartmentModel(
    image: MImage.apartmentOne,
    apartmentName: "Property 1",
    location: "123 property one",
    rating: 3.3,
    price: 2000,
    type: Type.apartments,
  ),
  ApartmentModel(
    image: MImage.barOne,
    apartmentName: "Property 2",
    location: "123 property two",
    rating: 2.5,
    price: 2580,
    type: Type.others,
  ),
  ApartmentModel(
    image: MImage.kitchenTwo,
    apartmentName: "La Grand Maison",
    location: "Tokyo, Japan",
    rating: 4.5,
    price: 1424,
    type: Type.house,
  ),
  ApartmentModel(
    image: MImage.livingRoomOne,
    apartmentName: "Property 3",
    location: "Tokyo, Japan",
    rating: 4.5,
    price: 2024,
    type: Type.house,
  ),
  ApartmentModel(
    image: MImage.livingRoomTwo,
    apartmentName: "Lucky Lake Apartments",
    location: "Beijing, China",
    rating: 4.1,
    price: 2345,
    type: Type.apartments,
  ),
];

final List<String> dummyMenus = [
  "All",
  "House",
  "Villa",
  "Apartments",
  "Others"
];
