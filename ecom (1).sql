-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 03, 2024 at 06:27 PM
-- Server version: 8.1.0
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecom`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `categories` varchar(255) NOT NULL,
  `status` tinyint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `categories`, `status`) VALUES
(2, 'Pendants', 1),
(4, 'Earrings', 1),
(5, 'Bracelets', 1),
(7, 'Rings', 1);

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(75) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `comment` text NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`id`, `name`, `email`, `mobile`, `comment`, `added_on`) VALUES
(1, 'Palpasa Manandhar', 'palpasa@gmail.com', '9800000000', 'Good Job!', '2024-05-29 16:07:14'),
(4, 'Sayjal Shrestha', 'sayjal@gmail.com', '9800000000', 'helloo', '2024-06-04 06:52:35'),
(5, 'Rhea', 'rhea@gmail.com', '9800000000', 'hello', '2024-07-08 02:20:46');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `address` varchar(250) NOT NULL,
  `city` varchar(50) NOT NULL,
  `pincode` int NOT NULL,
  `payment_type` varchar(20) NOT NULL,
  `total_price` float NOT NULL,
  `payment_status` varchar(20) NOT NULL,
  `order_status` int NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `user_id`, `address`, `city`, `pincode`, `payment_type`, `total_price`, `payment_status`, `order_status`, `added_on`) VALUES
(47, 4, 'Ombahal', 'Kathmandu', 10111, 'cod', 3000, 'success', 1, '2024-07-10 02:43:50'),
(48, 4, 'Ombahal', 'Kathmandu', 1088, 'E-Sewa', 1650, 'pending', 4, '2024-07-10 02:44:24'),
(49, 1, 'Padma Sundar Marg', 'Kathmandu', 1088, 'E-Sewa', 1350, 'pending', 1, '2024-07-10 06:04:03');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `qty` int NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`id`, `order_id`, `product_id`, `qty`, `price`) VALUES
(53, 47, 30, 3, 1000),
(54, 48, 29, 3, 550),
(55, 49, 35, 1, 350),
(56, 49, 30, 1, 1000);

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

CREATE TABLE `order_status` (
  `id` int NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `order_status`
--

INSERT INTO `order_status` (`id`, `name`) VALUES
(1, 'Pending'),
(2, 'Processing'),
(3, 'Shipped'),
(4, 'Canceled'),
(5, 'Complete');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int NOT NULL,
  `categories_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `qty` int NOT NULL,
  `image` varchar(255) NOT NULL,
  `short_desc` varchar(2000) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(2000) NOT NULL,
  `meta_desc` varchar(2000) NOT NULL,
  `meta_keyword` varchar(2000) NOT NULL,
  `status` tinyint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `categories_id`, `name`, `price`, `qty`, `image`, `short_desc`, `description`, `meta_title`, `meta_desc`, `meta_keyword`, `status`) VALUES
(2, 4, 'Pearl Earring', 200, 1, '789523726_pearl.jpg', 'Pearl ear top suitable for formal, casual as well as party ocassion', 'Enhance your elegance with these classic pearl ear tops. Crafted with high-quality freshwater pearls, these ear tops feature a lustrous finish that adds a touch of sophistication to any outfit. Perfect for both everyday wear and special occasions, they make a timeless addition to your jewelry collection. Secure and comfortable, they are designed to complement your style effortlessly.', 'pearl', '', 'pearl', 1),
(3, 5, 'Emerald Gemstone Bracelet', 250, 1, '128585803_images.jpg', 'Green emerald gemstone braclet to elevet your style', 'Elevate your elegance with our stunning Emerald Gemstone Bracelet. Crafted with high-quality emeralds, this bracelet features vibrant green stones that symbolize renewal and growth. Whether as a gift or a personal indulgence, this bracelet adds a touch of sophistication and natural beauty to your jewelry collection.', 'emerald', '', 'green emrald', 1),
(4, 2, 'Butterfly Pendant', 300, 1, '314288400_f.jpg', 'Elegant butterfly pendant to elevate you style', '\"Exquisite Butterfly Pendant - This beautifully crafted butterfly pendant captures the delicate elegance of nature. Made from high-quality materials, it features intricate detailing and a polished finish that adds a touch of sophistication to any outfit. Perfect for gifting or adding a charming accessory to your jewelry collection.\"', 'fly', '', 'fly', 1),
(5, 2, 'Lucky Pendant', 500, 1, '381248302_t.jpg', 'Turtle pendant to bring good luck to you', 'Add a touch of charm and elegance to your jewelry collection with our Elegant Turtle Pendant Necklace. This beautifully crafted piece features a delicately detailed turtle, symbolizing longevity and protection. Made from high-quality materials, it boasts a polished finish that catches the light perfectly. Ideal for daily wear or special occasions, this pendant makes a thoughtful gift for loved ones or a delightful treat for yourself. Available in gold, silver, and rose gold finishes.u', 'pendant', '', 'pendant', 1),
(6, 5, 'Butterfly Bracelet', 300, 1, '476380576_b.jpg', 'Blue stone bracelet to style your look', 'Add a touch of elegance to your ensemble with our Bluestone Butterfly Bracelet. Crafted with high-quality bluestone and featuring delicate butterfly charms, this bracelet is a perfect blend of sophistication and charm. Ideal for both casual and formal occasions, it makes a stunning addition to any jewelry collection.', 'bracelet', '', 'bracelet', 1),
(7, 4, 'Ear Hoop', 250, 1, '862117129_1.jpg', 'Aesthetic ear hoop that goes with every look', 'A stylish and versatile ear hoop crafted from high-quality materials, perfect for adding a touch of elegance to any outfit. Lightweight and comfortable for all-day wear, this hoop is a must-have accessory for any jewelry collection.', 'earrings', '', 'earrings', 1),
(8, 7, 'Pink Sapphire Ring', 200, 1, '651916516_r3.jpg', 'Pink Sapphire Ring for girly girls who loves pink', 'Discover timeless elegance with our stunning Pink Sapphire Ring. Featuring a vibrant, ethically-sourced pink sapphire set in a meticulously crafted sterling gold band, this ring exudes sophistication and charm. Perfect for adding a touch of color to any outfit or as a thoughtful gift for a loved one, this ring combines luxury with everyday wearability. Embrace the beauty of fine jewelry with this exquisite piece, designed to make every moment sparkle.', 'rings', '', 'rings', 1),
(9, 7, 'Pearl Ring', 300, 1, '213166759_r4.jpg', 'Pearl Ring for pearl lovers.', 'Discover timeless elegance with our stunning pearl ring. Featuring a lustrous, perfectly round pearl set in a sleek sterling silver band, this ring exudes sophistication and grace. Ideal for any occasion, this classic piece will add a touch of refinement to your jewelry collection. Perfect as a gift or a personal treat, it’s a must-have accessory for those who appreciate understated luxury.', 'rings', '', 'rings', 1),
(10, 7, 'Heart Ring', 250, 1, '757751096_love.jpg', 'Delight in the elegance of this stunning heart ring', 'Delight in the elegance of this stunning gold plated heart ring, meticulously crafted to symbolize love and devotion. The heart-shaped design is both timeless and contemporary, making it a perfect gift for someone special or a cherished addition to your own jewelry collection. Available in various sizes, this ring boasts a smooth, polished finish that enhances its sophisticated charm. Ideal for anniversaries, birthdays, or just because, the 14K Gold Heart Ring is a beautiful expression of affection and style.', 'rings', '', 'rings', 1),
(11, 7, 'Infinity Ring', 200, 1, '569060518_infinity.jpg', 'Timeless elegance with our Infinity Ring', 'Embrace timeless elegance with our Infinity Symbol Ring. Crafted with precision, this stunning piece features a delicate infinity symbol, representing endless love and commitment. Perfect for daily wear or special occasions, it\'s an exquisite addition to any jewelry collection. Available in sterling silver, gold, and rose gold.', 'rings', '', 'rings', 1),
(12, 7, 'Square Cut Diamond Ring', 550, 1, '530232497_Square Diamond.jfif', 'Radiate sophistication with its brilliant facets', '\"Discover timeless elegance with our square cut diamond ring, crafted to perfection. Radiate sophistication with its brilliant facets and modern design, ideal for every occasion.\"', 'rings', '', 'rings', 1),
(13, 7, 'Solitaire Ring', 400, 1, '250490273_solitaire.jpg', 'where simplicity meets sophistication in every brilliant cut', '\"Discover timeless elegance with our exquisite solitaire ring, where simplicity meets sophistication in every brilliant cut. Crafted to captivate, each ring is a testament to enduring beauty and impeccable craftsmanship, perfect for celebrating life\'s most precious moments.\"', 'rings', '', 'rings', 1),
(14, 7, 'Kpop Heart Thin Dianty Ring', 300, 1, '429083005_Kpop-Heart.jpg', 'Enhance your style with our K-pop Heart Thin Dainty Ring', '\"Enhance your style with our K-pop Heart Thin Dainty Ring, a delicate accessory that exudes elegance and K-pop charm. Crafted with precision, this ring is perfect for everyday wear or special occasions, adding a touch of subtle glamour to any ensemble.\"', 'rings', '', 'rings', 1),
(15, 2, 'Heart Pendant', 300, 1, '888536222_pen1.jpg', 'Capture hearts with our exquisite Heart-Shaped Pendant', '\"Capture hearts with our exquisite Heart-Shaped Pendant, a symbol of love and elegance. Crafted with precision and adorned with sparkling details, this pendant is perfect for expressing your affection or adding a touch of romance to any outfit.\"', 'pendant', '', 'pendant', 1),
(16, 2, 'Star Pendant', 250, 1, '440187626_star.jpg', 'Discover celestial beauty with our Star-Shaped Pendant', '\"Discover celestial beauty with our Star-Shaped Pendant. Crafted to capture the essence of the night sky, this exquisite piece radiates charm and elegance. Perfect for adding a celestial touch to any outfit, whether worn alone or layered for a personalized look.\"', 'pendants', 'pendants', 'pendants', 1),
(17, 2, 'Flower Peridot Pendant', 300, 1, '319192539_Flower peridot.jpg', 'Elevate your look with our Flower Peridot Pendant', '\"Elevate your look with our Flower Peridot Pendant, a stunning blend of nature-inspired beauty and vibrant elegance. Featuring a radiant peridot stone in a delicate floral design, this pendant is a perfect addition to any jewelry collection, combining timeless appeal with a touch of modern sophistication.\"', 'pendant', 'pendant', 'pendant', 1),
(18, 2, 'Fashion Tulips Rose Pendant', 450, 1, '505255709_tulip.jpg', 'Embrace timeless elegance with our Tulip Rose Pendant', '\"Embrace timeless elegance with our Tulip Rose Pendant, a graceful symbol of beauty and sophistication. Crafted with exquisite detail, this pendant features a delicate tulip design adorned with a radiant rose motif, making it a perfect addition to your jewelry collection or a thoughtful gift for someone special.\"', 'pendant', 'pendant', 'pendant', 1),
(19, 2, 'Branch Leaf Pendant', 400, 1, '972174968_leaf.jpg', 'A nature-inspired accessory crafted to perfection', 'Discover timeless elegance with our Branch Leaf Pendant, a nature-inspired accessory crafted to perfection. This delicate pendant features intricately designed branches and leaves, symbolizing growth and beauty. Ideal for adding a touch of natural sophistication to any outfit.\"', 'pendant', '', 'pendant', 1),
(20, 4, 'Flower Huggie Earrings', 300, 1, '919754524_flower.jpg', 'Embrace effortless elegance with our Flower Huggies Earrings', 'Embrace effortless elegance with our Flower Huggies Earrings. Delicately designed to hug your earlobes, these earrings feature charming floral accents that bring a touch of natural beauty to any outfit. Perfect for both casual and formal occasions, they\'re a must-have addition to your jewelry collection.\"', 'earrings', 'earrings', 'earrings', 1),
(21, 4, 'Moon and Star Earring', 450, 1, '935072508_moon.jpg', 'Shine like the night sky with our Moon and Star Earrings', '\"Shine like the night sky with our Moon and Star Earrings. Delicately crafted to capture celestial beauty, these earrings are perfect for adding a touch of whimsical charm to your look. Whether worn casually or for a special occasion, they\'re sure to sparkle with every move.\"', 'earring', 'earring', 'earring', 1),
(22, 4, 'Twisted Circles Stripe Earring', 450, 1, '605170413_twisted.jpg', 'Fusion of modern elegance and timeless charm', 'Elevate your look with our Twisted Circles Stripe Earrings, a fusion of modern elegance and timeless charm. Featuring intertwining circles and sleek stripes, these earrings are a must-have accessory for adding sophistication and flair to any outfit.\"', 'earring', '', 'earring', 1),
(23, 4, 'Drop Bow Earring', 350, 1, '155476006_drop.jpg', 'Crafted with precision and featuring bow', 'Elevate your look with our exquisite Drop Earrings, designed to add a touch of elegance and sophistication to any outfit. Crafted with precision and featuring bow, these earrings are perfect for both casual outings and formal events, making them a versatile addition to your jewelry collection.\"', 'earring', 'earring', 'earring', 1),
(24, 4, 'Diamond Cluster Earring', 350, 1, '445457284_cluster.jpg', 'Radiate sophistication with our Diamond Cluster Earrings', '\"Radiate sophistication with our Diamond Cluster Earrings, a stunning blend of luxury and elegance. Each earring showcases a cluster of sparkling diamonds meticulously set to captivate and dazzle. Perfect for adding timeless glamour to any outfit, these earrings are a must-have for your jewelry collection.\"', 'earrings', '', 'earrings', 1),
(25, 5, 'Metal Beads Bracelet', 400, 1, '857488311_beads.jpg', 'Sleek and versatile accessory crafted for modern style', 'Elevate your wrist with our Metal Beads Bracelet, a sleek and versatile accessory crafted for modern style. Featuring meticulously placed metal beads, this bracelet effortlessly combines elegance with everyday wearability, making it the perfect addition to your jewelry collection.\"', 'bracelet', 'bracelet', 'bracelet', 1),
(26, 5, 'Solo Nova Bracelet', 450, 1, '245764416_nova.jpg', 'A statement piece that embodies sophistication and modern elegance', '\"Elevate your style with the Solo Nova Bracelet, a statement piece that embodies sophistication and modern elegance. Crafted with meticulous detail, this bracelet features a sleek design that effortlessly complements any look, making it the perfect accessory for both casual outings and special events.\"', 'bracelet', '', 'bracelet', 1),
(27, 5, 'Snake Chain Bracelet', 550, 1, '982059407_snake.jpg', 'Sleek appearance resembling the scales of a snake', 'A snake chain bracelet is a type of jewelry characterized by its smooth, sleek appearance resembling the scales of a snake. It typically consists of small, round metal plates or bands tightly joined together to form a flexible, twisting chain. This design allows the bracelet to rest smoothly against the skin and gives it a distinctive, elegant look. Snake chain bracelets are popular for their durability, comfort, and ability to complement both casual and formal attire.', 'bracelet', 'bracelet', 'bracelet', 1),
(28, 5, 'Spiral Bracelet', 550, 1, '497316325_spiral.jpg', 'Discover elegance intertwined with simplicity in our Spiral Bracelet', '2/2\r\n\r\nChatGPT\r\n\"Discover elegance intertwined with simplicity in our Spiral Bracelet. Crafted with exquisite detail, this bracelet features a mesmerizing spiral design that effortlessly complements any ensemble, making it a timeless addition to your jewelry collection.\"', 'bracelet', '', 'bracelet', 1),
(29, 5, 'Three Stone Bracelets', 550, 1, '754089783_three stone.jpg', 'Three Stone Bracelet, a testament to timeless elegance', 'Elevate your style with our exquisite Three Stone Bracelet, a testament to timeless elegance. Crafted with meticulous attention to detail, each bracelet features three dazzling stones set in a delicate chain, creating a harmonious blend of sophistication and allure. Whether worn solo for a touch of everyday luxury or stacked with other favorites, this bracelet is a versatile must-have in any jewelry collection. Perfect for gifting or treating yourself, it effortlessly transitions from day to night, making it the perfect companion for any occasion.', 'bracelets', 'bracelet', 'bracelet', 1),
(30, 5, 'Trendy Diamond Bracelet', 1000, 1, '845371515_trendy.jpg', 'Diamond Chain Bracelet, a mesmerizing blend of sophistication and style', 'Elevate your everyday elegance with our exquisite Diamond Chain Bracelet, a mesmerizing blend of sophistication and style. Crafted with precision, each link sparkles with meticulously set round-cut diamonds, totaling [carat weight]. This timeless piece is crafted in [metal type] for enduring beauty and is perfect for adding a touch of luxury to any ensemble. Whether worn solo for understated glamour or layered for a more dramatic effect, this bracelet is a symbol of refined taste and unparalleled craftsmanship.', 'bracelet', 'bracelet', 'bracelet', 1),
(31, 4, 'Night Star Earring', 450, 1, '271397957_single.jpg', 'Shine like the night sky with our Star Earring', '\"Shine like the night sky with our Star Earring, a celestial-inspired accessory that adds a touch of cosmic elegance to any outfit. Crafted with precision and adorned with sparkling crystals, these earrings are perfect for those who love to sparkle and stand out. Whether for a special occasion or everyday glamour, our Star Earring is sure to make you feel like a star.\"', 'earring', 'earring', 'earring', 1),
(32, 2, 'Nature Pendant', 450, 1, '311902359_tree.jpg', 'Timeless elegance with our exquisite Round Tree Pendant symbolizing nature', 'Discover timeless elegance with our exquisite Round Tree Pendant. Crafted from sterling silver, this pendant features intricate detailing of a majestic tree spreading its branches. Perfect for nature lovers and those who cherish symbolic jewelry, this pendant is a symbol of growth, strength, and rootedness. Ideal for everyday wear or special occasions, it makes a thoughtful gift that will be treasured for years to come. Add a touch of natural beauty to your collection with this stunning Round Tree Pendant.', 'pendant', 'pendant', 'pendant', 1),
(33, 7, 'Minimalist Ring', 650, 1, '953363040_Minimalist.jpeg', 'a timeless piece that embodies simplicity and elegance', '\"Elevate your style with our minimalist ring, a timeless piece that embodies simplicity and elegance. Crafted from high-quality stone, its sleek design complements any look, from casual to formal. Perfect for everyday wear or as a thoughtful gift, this ring adds a touch of sophistication to every occasion.\"', 'ring', 'ring', 'ring', 0),
(35, 2, 'Heart-Shaped Pendant', 350, 1, '723092839_dil.jpg', 'Elegant Heart-Shaped Pendant Necklace', 'Express your love with our Elegant Heart-Shaped Pendant Necklace. Crafted from high-quality sterling gold , this timeless piece adds a touch of elegance to any outfit. Perfect for special occasions or everyday wear, it makes an ideal gift for loved ones or a charming addition to your own jewelry collection.', 'pendant', 'pendant', 'pendant', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `password`, `email`, `mobile`, `added_on`) VALUES
(1, 'Rachana Maskey', 'rachana1', 'rachana@gmail.com', '9841000000', '2024-05-29 16:08:09'),
(4, 'smriti shakya', 'smriti1', 'smriti@gmail.com', '9841005005', '2024-07-10 02:41:32');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
