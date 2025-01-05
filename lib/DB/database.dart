import 'package:mega_store/models/items_model.dart';
import 'package:mega_store/models/user_model.dart';

class Database {
  static Map<String, List<ItemsModel>> cart = {};
  static List<ItemsModel> items = [
    ItemsModel(productName: "TMA-2 HD Wireless", price: 120, id: 5, reviewers: 5, rating: 4.5, image: "assets/TMA-2 HD Wireless.png", description: "The **TMA-2 HD Wireless** headphones are a premium audio solution designed for discerning listeners who value exceptional sound quality, comfort, and versatility. Equipped with high-definition audio drivers, these headphones deliver crystal-clear sound with deep bass, rich mids, and detailed highs, ensuring an immersive listening experience for music enthusiasts and professionals alike. The wireless connectivity features Bluetooth with aptX HD support, providing low-latency, high-fidelity audio transmission for a seamless experience. With a minimalist, modular design, the TMA-2 HD Wireless allows for customization and upgrades, ensuring long-term usability and personalization.Crafted with lightweight, durable materials, the headphones feature ultra-soft memory foam ear cushions coated in Alcantara® for superior comfort during extended use. The impressive battery life of up to 20 hours ensures uninterrupted listening on the go, while the option to switch to a wired connection offers added flexibility.Whether you're a music producer, audiophile, or everyday listener, the TMA-2 HD Wireless combines cutting-edge technology with sleek, sustainable design for a truly outstanding audio experience."),
    ItemsModel(
        id: 1,
        productName: "Asus TUF Gaming",
        price: 3200,
        reviewers: 150,
        rating: 4.5,
        image: "assets/asus tuf gaming.png",
        description:
            "The Asus TUF Gaming laptop is a powerhouse designed for serious gamers and professionals. With a robust build that meets military-grade standards, it offers durability for on-the-go use. It features high-end specifications including a fast processor, powerful GPU, and ample storage. Whether you’re playing the latest AAA games or working on intensive projects, this laptop delivers seamless performance. Additionally, its advanced cooling system ensures consistent performance during extended gaming sessions."),
    ItemsModel(
        id: 2,
        productName: "Computer Mouse Razer Mamba",
        price: 150,
        reviewers: 70,
        rating: 4,
        image: "assets/Computer mouse Razer Mamba.png",
        description:
            "The Razer Mamba gaming mouse is built for precision and comfort. Featuring advanced optical sensors, it ensures pinpoint accuracy, making it ideal for fast-paced games. Its ergonomic design reduces fatigue, allowing for hours of uninterrupted gaming. Customizable RGB lighting adds a personal touch, while onboard memory saves your settings for use on the go. This mouse combines cutting-edge technology with a sleek design to enhance your gaming experience."),
    ItemsModel(
        id: 3,
        productName: "iPhone 15 Pro Max",
        price: 4500,
        reviewers: 30,
        rating: 5,
        image: "assets/iphone 15 pro max.png",
        description:
            "The iPhone 15 Pro Max represents the pinnacle of smartphone innovation. Featuring a stunning design crafted from aerospace-grade materials, it is both stylish and durable. Powered by the latest A-series chip, it delivers unmatched performance, perfect for gaming, multitasking, and high-resolution video editing. The enhanced camera system captures professional-quality photos and videos, even in challenging lighting conditions. With advanced features like Dynamic Island and the latest iOS software, this phone redefines the smartphone experience."),
    ItemsModel(
        id: 4,
        productName: "Headset Xbox 360 Headphones Gamer Wireless",
        price: 175,
        reviewers: 47,
        rating: 5,
        image: "assets/Headset Xbox 360 Headphones Gamer Wireless.png",
        description:
            "Designed for gamers, the Xbox 360 Wireless Headset offers superior audio clarity and immersive soundscapes. Its lightweight design ensures comfort during long gaming marathons, and the adjustable microphone provides crystal-clear communication with teammates. With a long-lasting battery and a wireless range suitable for couch gaming, it’s perfect for those who value mobility and high-quality audio performance. Experience gaming as it’s meant to be with this premium headset."),
    ItemsModel(
        id: 5,
        productName: "Microphone Headphones Wireless 7.1",
        price: 250,
        reviewers: 30,
        rating: 5,
        image: "assets/Microphone Headphones Wireless 7.1.png",
        description:
            "These Wireless 7.1 Microphone Headphones are engineered for professionals and audiophiles alike. Featuring 7.1 surround sound technology, they provide an unparalleled audio experience, perfect for gaming, streaming, or conference calls. The integrated microphone ensures your voice is heard clearly, while noise-cancelling technology minimizes background distractions. With premium materials and a comfortable design, these headphones are built for extended use without compromising on sound quality."),
    ItemsModel(
        id: 6,
        productName: "Xbox One Controller Microsoft Xbox One Wireless",
        price: 150,
        reviewers: 75,
        rating: 5,
        image: "assets/Xbox One controller Microsoft Xbox One Wireless.png",
        description:
            "The Microsoft Xbox One Wireless Controller is the ultimate tool for gamers. Its ergonomic design and textured grips provide a comfortable and secure feel, ensuring precise control during gameplay. Featuring responsive triggers and buttons, this controller delivers a smooth and accurate gaming experience. The wireless connectivity ensures freedom of movement, while compatibility with PC and Xbox expands its versatility. Whether you’re battling online or exploring open-world games, this controller elevates your gaming sessions."),
  ];
  static List<UserModel> users = [UserModel(email: "yosra@gmail.com",password: "123456",name: "yosra",phoneNumber: "53423830"),UserModel(email: "example@example.com",name: "example",phoneNumber: "22156789",password: "123456")];
  static String authenticatedUser = "";
}
