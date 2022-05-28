-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 10, 2020 lúc 03:45 PM
-- Phiên bản máy phục vụ: 10.4.11-MariaDB
-- Phiên bản PHP: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `travel`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(19, '2014_10_12_000000_create_users_table', 1),
(20, '2014_10_12_100000_create_password_resets_table', 1),
(21, '2019_06_11_145812_create_tbl_admin_table', 1),
(22, '2019_06_17_161852_create_tbl_category_product', 1),
(23, '2019_06_19_152045_create_tbl_brand_product', 1),
(24, '2019_06_19_155204_create_tbl_product', 1),
(25, '2019_08_17_030852_tbl_customer', 1),
(26, '2019_08_17_044054_tbl_shipping', 2),
(30, '2019_08_28_142718_tbl_payment', 3),
(31, '2019_08_28_142750_tbl_order', 3),
(32, '2019_08_28_142810_tbl_order_details', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `admin_id` int(10) UNSIGNED NOT NULL,
  `admin_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_admin`
--

INSERT INTO `tbl_admin` (`admin_id`, `admin_email`, `admin_password`, `admin_name`, `admin_phone`, `created_at`, `updated_at`) VALUES
(1, 'admin@sict.udn.vn', '827ccb0eea8a706c4c34a16891f84e7b', 'Nguyễn Tấn Lượng', '0329264630', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_brand`
--

CREATE TABLE `tbl_brand` (
  `brand_id` int(10) UNSIGNED NOT NULL,
  `brand_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(255) NOT NULL,
  `brand_status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_brand`
--

INSERT INTO `tbl_brand` (`brand_id`, `brand_name`, `category_id`, `brand_status`, `created_at`, `updated_at`) VALUES
(2, 'Tp Hồ Chí Minh', 4, 1, NULL, NULL),
(3, 'Đà Nẵng', 4, 1, NULL, NULL),
(4, 'Nha Trang', 4, 1, NULL, NULL),
(5, 'Đà Lạt', 4, 1, NULL, NULL),
(6, 'Gia Lai', 4, 1, NULL, NULL),
(7, 'Huế', 4, 1, NULL, NULL),
(8, 'Phú Quốc', 4, 1, NULL, NULL),
(9, 'Phan Thiết', 4, 1, NULL, NULL),
(10, 'Phú Yên', 4, 1, NULL, NULL),
(11, 'Singapore', 5, 1, NULL, NULL),
(12, 'Trung Quốc', 5, 1, NULL, NULL),
(13, 'Hàn Quốc', 5, 1, NULL, NULL),
(14, 'Nhật Bản', 5, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_category_product`
--

CREATE TABLE `tbl_category_product` (
  `category_id` int(10) UNSIGNED NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_category_product`
--

INSERT INTO `tbl_category_product` (`category_id`, `category_name`, `category_desc`, `category_status`, `created_at`, `updated_at`) VALUES
(4, 'Tour trong nước', '<p>C&aacute;c tour du lịch c&oacute; địa điểm trong nước</p>', 1, NULL, NULL),
(5, 'Tour nước ngoài', '<p>c&aacute;c tour du lịch ở ch&acirc;u &acirc;u ch&acirc;u &aacute; ch&acirc;u phi</p>', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_comment`
--

CREATE TABLE `tbl_comment` (
  `comment_id` bigint(10) NOT NULL,
  `product_id` int(10) NOT NULL,
  `comment_email` varchar(100) COLLATE utf8_vietnamese_ci NOT NULL,
  `comment_name` varchar(100) COLLATE utf8_vietnamese_ci NOT NULL,
  `comment_content` text COLLATE utf8_vietnamese_ci NOT NULL,
  `comment_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_comment`
--

INSERT INTO `tbl_comment` (`comment_id`, `product_id`, `comment_email`, `comment_name`, `comment_content`, `comment_date`) VALUES
(1, 4, 'nguyenvanluong101@gmail.com', 'Nguyễn Tấn Lượng', '<p>tuyệt vời</p>', '2020-01-10 17:23:16'),
(2, 4, 'nvbe@gmail.com', 'Nguyễn Văn B', '<p>yeah! &lt;3</p>', '2020-01-10 17:32:03'),
(3, 4, 'nguyenvanluong101@gmail.com', 'Nguyễn Tấn Lượng', '<p>Mong c&oacute; thật nhiều tiền để di du lịch</p>', '2020-01-10 21:36:31');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_customers`
--

CREATE TABLE `tbl_customers` (
  `customer_id` int(10) UNSIGNED NOT NULL,
  `customer_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_birthday` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_customers`
--

INSERT INTO `tbl_customers` (`customer_id`, `customer_name`, `customer_email`, `customer_password`, `customer_phone`, `customer_birthday`, `created_at`, `updated_at`) VALUES
(6, 'Nguyễn Tấn Lượng', 'ntluong@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', '0329264630', '2000-10-20', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_order`
--

CREATE TABLE `tbl_order` (
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` int(11) NOT NULL,
  `shipping_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `order_total` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_date` date NOT NULL,
  `order_status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_order`
--

INSERT INTO `tbl_order` (`order_id`, `customer_id`, `shipping_id`, `payment_id`, `order_total`, `order_date`, `order_status`, `created_at`, `updated_at`) VALUES
(14, 6, 14, 3, '119490000', '2020-01-10', '1', NULL, NULL),
(15, 6, 15, 3, '39830000', '2020-01-10', '1', NULL, NULL),
(16, 6, 16, 3, '39830000', '2020-01-10', '1', NULL, NULL),
(17, 6, 17, 3, '39830000', '2020-01-10', '1', NULL, NULL),
(18, 6, 18, 3, '17070000', '2020-01-10', '1', NULL, NULL),
(20, 6, 20, 3, '17070000', '2020-01-10', '0', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_order_details`
--

CREATE TABLE `tbl_order_details` (
  `order_details_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_sales_quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_order_details`
--

INSERT INTO `tbl_order_details` (`order_details_id`, `order_id`, `product_id`, `product_name`, `product_price`, `product_sales_quantity`, `created_at`, `updated_at`) VALUES
(10, 9, 4, 'Đà Nẵng - Bà Nà - Cầu Vàng - Sơn Trà - Hội An - KDL Thần Tài - Đà Nẵng', '5690000', 3, NULL, NULL),
(15, 15, 4, 'Đà Nẵng - Bà Nà - Cầu Vàng - Sơn Trà - Hội An - KDL Thần Tài - Đà Nẵng', '5690000', 7, NULL, NULL),
(16, 16, 4, 'Đà Nẵng - Bà Nà - Cầu Vàng - Sơn Trà - Hội An - KDL Thần Tài - Đà Nẵng', '5690000', 7, NULL, NULL),
(17, 18, 4, 'Đà Nẵng - Bà Nà - Cầu Vàng - Sơn Trà - Hội An - KDL Thần Tài - Đà Nẵng', '5690000', 3, NULL, NULL),
(19, 20, 4, 'Đà Nẵng - Bà Nà - Cầu Vàng - Sơn Trà - Hội An - KDL Thần Tài - Đà Nẵng', '5690000', 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_payment`
--

CREATE TABLE `tbl_payment` (
  `payment_id` bigint(20) UNSIGNED NOT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_desc` varchar(50) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_payment`
--

INSERT INTO `tbl_payment` (`payment_id`, `payment_method`, `payment_desc`, `created_at`, `updated_at`) VALUES
(1, 'COD', 'Trả tiền khi nhận vé', NULL, NULL),
(2, 'ATM', 'Trả tiền thông qua thẻ ngân hàng', NULL, NULL),
(3, 'QRcode', 'Trả tiền thông qua mã QR', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_product`
--

CREATE TABLE `tbl_product` (
  `product_id` int(10) UNSIGNED NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `place_start` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `place_end` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_start` date NOT NULL,
  `date_end` date NOT NULL,
  `product_desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_product`
--

INSERT INTO `tbl_product` (`product_id`, `product_name`, `category_id`, `place_start`, `place_end`, `date_start`, `date_end`, `product_desc`, `product_content`, `product_price`, `product_image`, `product_status`, `created_at`, `updated_at`) VALUES
(4, 'Đà Nẵng - Bà Nà - Cầu Vàng - Sơn Trà - Hội An - KDL Thần Tài - Đà Nẵng', 4, 'Tp Hồ Chí Minh', 'Đà Nẵng', '2020-02-14', '2020-02-17', '<p>3 ng&agrave;y 2 đ&ecirc;m</p>', '<h3>NG&Agrave;Y 1 - TP.HỒ CH&Iacute; MINH - Đ&Agrave; NẴNG - SƠN TR&Agrave; - HỘI AN - SỐ BỮA ĂN: 02 (ĂN TRƯA, TỐI)</h3>\r\n\r\n<p>Hồ Ch&iacute; Minh</p>\r\n\r\n<p>Qu&yacute; kh&aacute;ch tập trung tại Ga đi trong nước, s&acirc;n bay T&acirc;n Sơn Nhất. Hướng dẫn vi&ecirc;n hỗ trợ l&agrave;m thủ tục cho đo&agrave;n đ&aacute;p chuyến bay đi Đ&agrave; Nẵng.</p>\r\n\r\n<p>Quảng Nam</p>\r\n\r\n<p><strong>Phố Cổ Hội An</strong>: Ch&ugrave;a Cầu, Nh&agrave; Cổ Ph&ugrave;ng Hưng, Hội Qu&aacute;n Phước Kiến, Cơ sở Thủ C&ocirc;ng Mỹ Nghệ,&hellip;</p>\r\n\r\n<p>Đo&agrave;n quay về lại Đ&agrave; Nẵng, tự do nghỉ ngơi.</p>\r\n\r\n<p>Đ&agrave; Nẵng</p>\r\n\r\n<p>Tại s&acirc;n bay Đ&agrave; Nẵng xe v&agrave; HDV Vietravel đ&oacute;n đo&agrave;n đi tham quan:&nbsp;</p>\r\n\r\n<p><strong>B&aacute;n đảo Sơn Tr&agrave;, viếng Ch&ugrave;a Linh Ứng</strong>: nơi đ&acirc;y c&oacute; tượng Phật Quan Thế &Acirc;m cao nhất Việt Nam, đứng nơi đ&acirc;y, Qu&yacute; kh&aacute;ch sẽ được chi&ecirc;m ngưỡng to&agrave;n cảnh th&agrave;nh phố, n&uacute;i rừng v&agrave; biển đảo Sơn Tr&agrave; một c&aacute;ch ho&agrave;n hảo nhất.&nbsp;</p>\r\n\r\n<p><strong>B&atilde;i biển Mỹ Kh&ecirc;</strong>&nbsp;- Một trong những b&atilde;i biển quyến rũ nhất h&agrave;nh tinh, Qu&yacute; kh&aacute;ch tự do dạo biển, chụp h&igrave;nh&hellip;&nbsp;&nbsp;</p>\r\n\r\n<p><strong>Faifo Making Village</strong>: Tham quan t&igrave;m hiểu c&aacute;ch chế biến tr&agrave; &ndash; caf&eacute; &ndash; tinh dầu, qu&yacute; kh&aacute;ch tự do thưởng thức tr&agrave; b&aacute;nh,...</p>\r\n\r\n<p>Nghỉ đ&ecirc;m tại Đ&agrave; Nẵng</p>\r\n\r\n<p>Lưu tr&uacute;</p>\r\n\r\n<p>Nghỉ đ&ecirc;m tại Đ&agrave; Nẵng</p>\r\n\r\n<h3>NG&Agrave;Y 2 - Đ&Agrave; NẴNG - KDL B&Agrave; N&Agrave; (CẦU V&Agrave;NG) - SỐ BỮA ĂN: 02 (ĂN S&Aacute;NG, TỐI)</h3>\r\n\r\n<p>Đ&agrave; Nẵng</p>\r\n\r\n<p>Ăn s&aacute;ng buffet tại kh&aacute;ch sạn. Xe đưa Qu&yacute; kh&aacute;ch đi tham quan:&nbsp;</p>\r\n\r\n<p>-&nbsp;<strong>Khu du lịch B&agrave; N&agrave; - Suối Mơ</strong>&nbsp;(chi ph&iacute; c&aacute;p treo &amp; ăn trưa tự t&uacute;c) - Tận hưởng kh&ocirc;ng kh&iacute; se lạnh của Đ&agrave; Lạt tại miền Trung, đo&agrave;n tham quan Ch&ugrave;a Linh Ứng, Hầm Rượu Debay, vườn hoa Le Jardin D&rsquo;Amour, Khu T&acirc;m linh mới của B&agrave; N&agrave; viếng Đền Lĩnh Ch&uacute;a Linh Từ, khu vui chơi Fantasy Park, tự do chụp h&igrave;nh tại Cầu V&agrave;ng điểm tham quan mới si&ecirc;u hot tại B&agrave; N&agrave;&hellip;Ăn trưa tại B&agrave; N&agrave; tự t&uacute;c. Sau đ&oacute; đo&agrave;n tiếp tục tham quan vui chơi đến giờ xuống c&aacute;p.&nbsp;</p>\r\n\r\n<p>Đ&agrave; Nẵng</p>\r\n\r\n<p>-&nbsp;<strong>Tặng Show Charming</strong>&nbsp;- Trải nghiệm n&eacute;t đẹp d&acirc;n tộc, tận hưởng n&eacute;t quyến rũ của Đ&agrave; Nẵng qua những lời ca v&agrave; giai điệu dạt d&agrave;o cảm x&uacute;c, tự cảm nhận vẻ đẹp đặc sắc nhất trong một đ&ecirc;m l&atilde;ng mạn.</p>\r\n\r\n<p>- Buổi tối Qu&yacute; kh&aacute;ch đi dạo bờ Đ&ocirc;ng s&ocirc;ng H&agrave;n (b&ecirc;n dưới đầu cầu Rồng) tự do xem v&agrave; tham gia &ldquo; H&aacute;t B&agrave;i Ch&ograve;i&rdquo; Di sản văn h&oacute;a phi vật thể nh&acirc;n loại đ&atilde; được UNESCO c&ocirc;ng nhận v&agrave;o ng&agrave;y 07/02/2018, loại h&igrave;nh nghệ thuật d&acirc;n gian n&agrave;y đ&atilde; xuất hiện c&aacute;ch đ&acirc;y khoảng 300 &ndash; 400 năm ở c&aacute;c tỉnh v&ugrave;ng Nam Trung Bộ&rdquo;&hellip;hoặc dạo phố thưởng ngoạn cảnh đẹp của Đ&agrave; Nẵng về đ&ecirc;m, ngắm nh&igrave;n Cầu Rồng, Cầu T&igrave;nh Y&ecirc;u, Cầu Trần Thị L&yacute;, Trung T&acirc;m Thương Mại, Khu phố ẩm thực, Caf&eacute; - Bar - Disco&hellip;.Nghỉ đ&ecirc;m tại Đ&agrave; Nẵng</p>\r\n\r\n<p><strong>Lưu &yacute;:</strong>&nbsp;Charming Show l&agrave; chương tr&igrave;nh tặng th&ecirc;m n&ecirc;n Vietravel sẽ kh&ocirc;ng ho&agrave;n lại trong trường hợp Qu&yacute; kh&aacute;ch kh&ocirc;ng tham gia hoặc phải hủy do c&aacute;c trường hợp kh&aacute;ch quan bất khả kh&aacute;ng c&oacute; th&ocirc;ng b&aacute;o của đơn vị tổ chức.&nbsp;</p>\r\n\r\n<h3>NG&Agrave;Y 3 - Đ&Agrave; NẴNG - KDL THẦN T&Agrave;I - TP. HỒ CH&Iacute; MINH - SỐ BỮA ĂN: 02 (ĂN S&Aacute;NG, TRƯA</h3>\r\n\r\n<p>Đ&agrave; Nẵng</p>\r\n\r\n<p>Ăn s&aacute;ng buffet tại kh&aacute;ch sạn. Xe đưa Qu&yacute; kh&aacute;ch đi tham quan:</p>\r\n\r\n<p>- Khu du lịch C&ocirc;ng vi&ecirc;n Suối kho&aacute;ng n&oacute;ng&nbsp;<strong>N&uacute;i Thần T&agrave;i</strong>: tại đ&acirc;y, Qu&yacute; kh&aacute;ch sẽ tắm kho&aacute;ng tại Long Nguyệt Hồ v&agrave; c&aacute;c hồ tự nhi&ecirc;n kh&aacute;c, thư giản với x&ocirc;ng hơi kh&ocirc;, x&ocirc;ng hơi ướt, ng&acirc;m ch&acirc;n trực tiếp tại c&aacute;c mỏ kho&aacute;ng ph&aacute;t lộ, vui chơi tại c&ocirc;ng vi&ecirc;n nước, trượt phao chinh phục d&ograve;ng s&ocirc;ng Lười, Viếng thăm Đền Thần T&agrave;i, trải nghiệp rạp chiếu phim 7D - 9D - 12D, tham quan chụp h&igrave;nh tại c&aacute;c điểm trong khu du lịch,&hellip; Tự do trải nghiệm c&aacute;c dịch vụ tắm Onsen Nhật Bản, tắm b&ugrave;n, tắm Tr&agrave; - Sữa - C&agrave; Ph&ecirc; - Sả&hellip;&nbsp;</p>\r\n\r\n<p>-&nbsp;<strong>Ngũ H&agrave;nh Sơn</strong>&nbsp;- Động T&agrave;ng Chơn, Động Hoa Nghi&ecirc;m, Ch&ugrave;a Non Nước, L&agrave;ng Đ&aacute; Mỹ Nghệ,..</p>\r\n\r\n<p>-&nbsp;<strong>Ky niem local specialites and souvernia shop</strong>: mua sắm đặc sản của Đ&agrave; Nẵng v&agrave; c&aacute;c v&ugrave;ng miền</p>\r\n\r\n<p>Hồ Ch&iacute; Minh</p>\r\n\r\n<p>Xe tiễn Qu&yacute; kh&aacute;ch ra s&acirc;n bay Đ&agrave; Nẵng đ&oacute;n chuyến bay trở về Tp.Hồ Ch&iacute; Minh. Chia tay Qu&yacute; kh&aacute;ch v&agrave; kết th&uacute;c chương tr&igrave;nh du lịch tại s&acirc;n bay T&acirc;n Sơn Nhất.</p>', '5690000', 'dn65.jpg', 1, NULL, NULL),
(5, 'Đà Nẵng - Bà Nà - Cầu Vàng - Hội An - Đầm Lập An - Làng Cổ Thủy Biều - Huế ( Khách sạn/Resort 4* trọn tour. Nghỉ dưỡng Resort Ecolodge Hue. Tặng Show Ký Ức Hội An. Bay Vietnam Airlines. Tour Tiêu Chuẩn) - Mùng 1 Tết', 4, 'Tp Hồ Chí Minh', 'Đà Nẵng', '2020-01-25', '2020-01-29', '<p>4 ng&agrave;y</p>', '<p>Hồ Ch&iacute; Minh</p>\r\n\r\n<p>Qu&yacute; kh&aacute;ch tập trung tại cột số 5, Ga đi trong nước, s&acirc;n bay T&acirc;n Sơn Nhất, hướng dẫn vi&ecirc;n Vietravel hỗ trợ l&agrave;m thủ tục cho đo&agrave;n đ&aacute;p chuyến bay đi Đ&agrave; Nẵng</p>\r\n\r\n<p>Hội An</p>\r\n\r\n<p>- Phố Cổ Hội An: Ch&ugrave;a Cầu, dạo phố đ&egrave;n lồng đầy m&agrave;u sắc, cảm nhận sự y&ecirc;n b&igrave;nh, cổ k&iacute;nh, l&atilde;ng mạn Hội An, thả hoa đăng cầu b&igrave;nh an, may mắn tr&ecirc;n S&ocirc;ng Ho&agrave;i,&hellip;&nbsp;</p>\r\n\r\n<p>- Tặng Show K&yacute; Ức Hội An : Vở diễn thực cảnh ngo&agrave;i trời t&aacute;i hiện cuộc sống th&ocirc;n của Phố Hội một thời.&nbsp;</p>\r\n\r\n<p>Đo&agrave;n quay về lại Đ&agrave; Nẵng, tự do nghỉ ngơi. Nghỉ đ&ecirc;m tại Đ&agrave; Nẵng&nbsp;</p>\r\n\r\n<p><strong>Lưu &yacute;:&nbsp;</strong>Show K&yacute; Ức Hội An l&agrave; chương tr&igrave;nh tặng&nbsp; sẽ kh&ocirc;ng ho&agrave;n lại chi ph&iacute; trong trường hợp Qu&yacute; kh&aacute;ch kh&ocirc;ng tham gia hoặc buộc phải hủy do c&aacute;c trường hợp kh&aacute;ch quan bất khả kh&aacute;ng c&oacute; th&ocirc;ng b&aacute;o của đơn vị tổ chức.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Đ&agrave; Nẵng</p>\r\n\r\n<p>Tại s&acirc;n bay Đ&agrave; Nẵng xe v&agrave; HDV đ&oacute;n đo&agrave;n đi tham quan:&nbsp;</p>\r\n\r\n<p>- B&aacute;n đảo Sơn Tr&agrave; v&agrave; Ch&ugrave;a Linh Ứng: Nơi chi&ecirc;m ngưỡng to&agrave;n cảnh th&agrave;nh phố, n&uacute;i rừng v&agrave; biển đảo Sơn Tr&agrave; một c&aacute;ch ho&agrave;n hảo nhất, với tượng Phật Quan Thế &Acirc;m cao nhất Việt Nam,&hellip;&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Lưu tr&uacute;</p>\r\n\r\n<p>Nghỉ đ&ecirc;m tại Đ&agrave; Nẵng&nbsp;</p>\r\n\r\n<h3>NG&Agrave;Y 2 - Đ&Agrave; NẴNG - B&Agrave; N&Agrave; CẢ NG&Agrave;Y - SỐ BỮA ĂN: 02 (ĂN S&Aacute;NG, CHIỀU)</h3>\r\n\r\n<p>Đ&agrave; Nẵng</p>\r\n\r\n<p>Ăn s&aacute;ng buffet tại kh&aacute;ch sạn. Xe đưa Qu&yacute; kh&aacute;ch đi tham quan:</p>\r\n\r\n<p>- Khu du lịch&nbsp;<strong>B&agrave; N&agrave; Suối Mơ</strong>&nbsp;(Chi ph&iacute; c&aacute;p treo &amp; Ăn trưa tự t&uacute;c): Trải nghiệm tuyến c&aacute;p treo một d&acirc;y d&agrave;i nhất thế giới. Tr&ecirc;n đỉnh n&uacute;i Qu&yacute; kh&aacute;ch tận hưởng kh&ocirc;ng kh&iacute; se lạnh của &ldquo;Đ&agrave; Lạt tại miền Trung&rdquo;, tham quan Ch&ugrave;a Linh Ứng, vườn hoa Le Jardin D&rsquo;Amour, khu t&acirc;m linh mới của B&agrave; N&agrave; viếng Đền Lĩnh Ch&uacute;a Linh Từ, khu vui chơi Fantasy Park với nhiều tr&ograve; chơi hấp dẫn, đi dạo v&agrave; chụp h&igrave;nh tại Cầu V&agrave;ng điểm tham mới si&ecirc;u hot tại B&agrave; N&agrave;,&hellip; Tự do tham quan vui chơi đền giờ xuống c&aacute;p. Hoặc Qu&yacute; kh&aacute;ch ở lại kh&aacute;ch sạn nghỉ ngơi, tự do đi tham quan danh thắng kh&aacute;c&nbsp; &nbsp;</p>\r\n\r\n<p>Buổi tối Qu&yacute; kh&aacute;ch tự t&uacute;c đi dạo bờ Đ&ocirc;ng s&ocirc;ng H&agrave;n (b&ecirc;n dưới đầu cầu Rồng) tự do xem v&agrave; tham gia &ldquo; H&aacute;t B&agrave;i Ch&ograve;i&rdquo; Di sản văn h&oacute;a phi vật thể nh&acirc;n loại đ&atilde; được UNESCO c&ocirc;ng nhận v&agrave;o ng&agrave;y 07/02/2018, loại h&igrave;nh nghệ thuật d&acirc;n gian n&agrave;y đ&atilde; xuất hiện c&aacute;ch đ&acirc;y khoảng 300 &ndash; 400 năm ở c&aacute;c tỉnh v&ugrave;ng Nam Trung Bộ&rdquo;&hellip;hoặc dạo phố thưởng ngoạn cảnh đẹp của Đ&agrave; Nẵng về đ&ecirc;m, ngắm nh&igrave;n Cầu Rồng, Cầu T&igrave;nh Y&ecirc;u, Cầu Trần Thị L&yacute;, Trung T&acirc;m Thương Mại, Khu phố ẩm thực, Caf&eacute; - Bar - Disco&hellip;.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Đ&agrave; Nẵng</p>\r\n\r\n<p>Nghỉ đ&ecirc;m tại Đ&agrave; Nẵng</p>\r\n\r\n<p>Lưu tr&uacute;</p>\r\n\r\n<p>Nghỉ đ&ecirc;m tại Đ&agrave; Nẵng</p>\r\n\r\n<h3>NG&Agrave;Y 3 - Đ&Agrave; NẴNG &ndash; HUẾ &ndash; L&Agrave;NG CỔ THỦY BIỀU - SỐ BỮA ĂN: 03 (ĂN S&Aacute;NG, TRƯA, CHIỀU)</h3>\r\n\r\n<p>Đ&agrave; Nẵng</p>\r\n\r\n<p>Ăn s&aacute;ng buffet tại kh&aacute;ch sạn. Qu&yacute; kh&aacute;ch khởi h&agrave;nh đi Huế</p>\r\n\r\n<p>Huế</p>\r\n\r\n<p>Tr&ecirc;n đường đi dừng tham quan:</p>\r\n\r\n<p>-&nbsp;<strong>Đầm Lập An</strong>: Ngắm cảnh m&acirc;y bồng bềnh tr&ecirc;n những ch&oacute;p n&uacute;i bao bọc quanh đầm&nbsp;</p>\r\n\r\n<p>-&nbsp;<strong>Đại Nội:</strong>&nbsp;ho&agrave;ng cung xưa của 13 vị vua triều Nguyễn, tham quan Ngọ M&ocirc;n, Điện Th&aacute;i H&ograve;a, Tử Cấm Th&agrave;nh, Thế Miếu, Hiển L&acirc;m C&aacute;c, Cửu Đỉnh, Bảo t&agrave;ng cổ vật Cung Đ&igrave;nh Huế&nbsp;</p>\r\n\r\n<p>-&nbsp;<strong>Ch&ugrave;a Thi&ecirc;n Mụ</strong>: ng&ocirc;i ch&ugrave;a được xem l&agrave; biểu tượng xứ Huế v&agrave; l&agrave; nơi lưu giữ nhiều cổ vật qu&yacute; gi&aacute; kh&ocirc;ng chỉ về mặt lịch sử m&agrave; c&ograve;n cả về nghệ thuật.</p>\r\n\r\n<p>Sau đ&oacute; khởi h&agrave;nh đi Thủy Biều nhận ph&ograve;ng tại khu Resort nghỉ dưỡng sinh th&aacute;i Hue Ecolodge.&nbsp;</p>\r\n\r\n<p>Buổi chiều Qu&yacute; kh&aacute;ch nghỉ ngơi thư gi&atilde;n, tận hưởng kh&ocirc;ng kh&iacute; trong l&agrave;nh v&agrave; khung cảnh y&ecirc;n b&igrave;nh tại resort, đi dạo v&agrave;&nbsp; ngắm nh&igrave;n ho&agrave;ng h&ocirc;n tr&ecirc;n S&ocirc;ng Hương, chụp h&igrave;nh ghi lại những khoảng khắc đẹp đ&aacute;ng nhớ b&ecirc;n người th&acirc;n, gia đ&igrave;nh,,.. hoặc tự do trải nghiệm c&aacute;c g&oacute;i dịch vụ tại Resort:&nbsp;</p>\r\n\r\n<p>- Kh&aacute;m ph&aacute; L&agrave;ng qu&ecirc; sinh th&aacute;i Thủy Biều v&agrave; tham gia c&aacute;c lớp học nấu ăn m&oacute;n đặc sản Huế... D&ugrave;ng xe đạp hoặc đi bộ tham quan kh&aacute;m ph&aacute; L&agrave;ng Cổ, một ng&ocirc;i l&agrave;ng rất y&ecirc;n tĩnh v&agrave; mang đậm ấn tượng l&agrave;ng qu&ecirc; truyền thống của Việt Nam, ngắm nh&igrave;n nh&agrave; cổ, nh&agrave; vườn, những c&aacute;nh đồng l&uacute;a, vườn thanh tr&agrave;, tận hưởng dịch vụ Massage v&agrave; ng&acirc;m ch&acirc;n trong nước thảo dược,... (chi ph&iacute; c&aacute;c g&oacute;i dịch vụ tự t&uacute;c ).</p>\r\n\r\n<p>Ăn chiều tại resort. Buổi tối Qu&yacute; kh&aacute;ch tự do nghỉ ngơi tham quan. Nghỉ đ&ecirc;m tại Huế - Khu L&agrave;ng Cổ Thủy Biều c&aacute;ch trung t&acirc;m Cố Đ&ocirc; Huế khoảng 8 km</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Lưu tr&uacute;</p>\r\n\r\n<p>Nghỉ đ&ecirc;m tại Huế</p>\r\n\r\n<h3>NG&Agrave;Y 4 - HUẾ - TP.HỒ CH&Iacute; MINH - SỐ BỮA ĂN: 02 (ĂN S&Aacute;NG,TRƯA)</h3>\r\n\r\n<p>Huế</p>\r\n\r\n<p>Ăn s&aacute;ng buffet tại kh&aacute;ch sạn/resort. Qu&yacute; kh&aacute;ch, tham quan tận hưởng c&aacute;c dịch vụ đến giờ trả ph&ograve;ng. Đo&agrave;n khởi h&agrave;nh đi ăn trưa, sau đ&oacute; tham quan:</p>\r\n\r\n<p>-&nbsp;<strong>Lăng Minh Mạng</strong>: Nơi c&oacute; phong cảnh sơn thủy hữu t&igrave;nh v&agrave; được cho l&agrave; một trong những lăng tẩm c&oacute; kiến tr&uacute;c đẹp nhất của c&aacute;c vua ch&uacute;a nh&agrave; Nguyễn.</p>\r\n\r\n<p>Xe đưa đo&agrave;n ra s&acirc;n bay Ph&uacute; B&agrave;i - Huế đ&oacute;n chuyến bay trở về Tp.Hồ Ch&iacute; Minh</p>\r\n\r\n<p>Đ&agrave; Nẵng</p>\r\n\r\n<p>Chia tay Qu&yacute; kh&aacute;ch v&agrave; kết th&uacute;c chương tr&igrave;nh tại s&acirc;n bay T&acirc;n Sơn Nhất.&nbsp;</p>\r\n\r\n<p>Lưu tr&uacute;</p>\r\n\r\n<p>Kết th&uacute;c chương tr&igrave;nh</p>', '10990000', 'traveldn59.jpg', 1, NULL, NULL),
(6, 'Combo Nha Trang: Vmb + Ks Starcity 5 sao + Tặng vé tắm bùn khoáng I-Resort', 4, 'Tp Hồ Chí Minh', 'Nha Trang', '2020-02-25', '2020-02-28', '<p>3 ng&agrave;y</p>', '<p>KHỞI H&Agrave;NH:&nbsp;</p>\r\n\r\n<p>- Th&aacute;ng 01/2020: 03 &ndash; 20/01/2020</p>\r\n\r\n<p>- Th&aacute;ng 02/2020: 07 &ndash; 28/02/2020</p>\r\n\r\n<p>- Th&aacute;ng 03/2020: 03 &ndash; 27/03/2020</p>\r\n\r\n<p>GI&Aacute; BAO GỒM:</p>\r\n\r\n<p>- 03 ng&agrave;y 02 đ&ecirc;m nghỉ dưỡng hạng ph&ograve;ng Deluxe tại Kh&aacute;ch sạn STARCITY 4*</p>\r\n\r\n<p>- V&eacute; m&aacute;y bay khứ hồi bao gồm h&agrave;nh l&yacute; x&aacute;ch tay&nbsp;</p>\r\n\r\n<p>- Bữa s&aacute;ng Buffet ti&ecirc;u chuẩn quốc tế&nbsp;</p>\r\n\r\n<p>- Tặng v&eacute; tắm b&ugrave;n kho&aacute;ng n&oacute;ng v&agrave; c&ocirc;ng vi&ecirc;n nước I-Resort</p>\r\n\r\n<p>- Miễn ph&iacute; nước suối, tr&agrave;, c&agrave; ph&ecirc; trong ph&ograve;ng</p>\r\n\r\n<p>- Miễn ph&iacute; sử dụng c&aacute;c dịch vụ tiện &iacute;ch của kh&aacute;ch sạn</p>\r\n\r\n<p>- Wifi miễn ph&iacute;</p>\r\n\r\n<p>- Thuế VAT, ph&iacute; phục vụ&nbsp;</p>\r\n\r\n<p>GI&Aacute; KH&Ocirc;NG BAO GỒM:</p>\r\n\r\n<p>- Chi ph&iacute; c&aacute; nh&acirc;n</p>\r\n\r\n<p>- Chi ph&iacute; trẻ em v&agrave; người lớn đi k&egrave;m.</p>\r\n\r\n<p>- Chi ph&iacute; đi lại.</p>\r\n\r\n<p>- H&agrave;nh l&yacute; qu&aacute; cước theo qui định của h&atilde;ng h&agrave;ng kh&ocirc;ng.</p>\r\n\r\n<p>- Ph&iacute; nhận ph&ograve;ng sớm v&agrave; trả ph&ograve;ng muộn theo qui định của kh&aacute;ch sạn.</p>\r\n\r\n<p>PHỤ THU: (VNĐ)</p>\r\n\r\n<p>T&ugrave;y theo ng&agrave;y khởi h&agrave;nh, số lượng kh&aacute;ch.</p>\r\n\r\n<p>- Ph&ograve;ng đơn (&Aacute;p dụng Kh&aacute;ch đi một người lớn)</p>\r\n\r\n<p>- Em b&eacute; dưới 02 tuổi (phụ thu h&agrave;ng kh&ocirc;ng, kh&ocirc;ng c&oacute; ghế tr&ecirc;n m&aacute;y bay): 300.000VND</p>\r\n\r\n<p>- Trẻ em từ 06-11 tuổi: 1.900.000VND/ kh&aacute;ch/ 3N2Đ</p>\r\n\r\n<p>- Người lớn thứ 3 (từ 12 tuổi) c&oacute; bao gồm giường phụ: 3.180.000VND/ kh&aacute;ch/ 3N2Đ&nbsp;</p>\r\n\r\n<p>(bao gồm v&eacute; m&aacute;y bay, giường phụ v&agrave; ăn s&aacute;ng tại kh&aacute;ch sạn)&nbsp;</p>\r\n\r\n<p>Lễ Tết, cuối tuần, cao điểm: phụ thu th&ecirc;m (vui l&ograve;ng li&ecirc;n hệ nh&acirc;n vi&ecirc;n TripU để biết th&ecirc;m th&ocirc;ng tin chi tiết)</p>\r\n\r\n<p>&nbsp;</p>', '2860000', '0b8ae21e-7bd7-4eb7-93f8-b33c9dc7dd2532.jpg', 1, NULL, NULL),
(7, 'Phú Yên - Quy Nhơn (Máy bay. Khách sạn 4*. Tour Tiêu Chuẩn)', 4, 'Tp Hồ Chí Minh', 'Phú Yên', '2020-02-06', '2020-01-09', '<p>3 Ng&agrave;y</p>', '<h3>NG&Agrave;Y 1 - TP.HỒ CH&Iacute; MINH - PH&Uacute; Y&Ecirc;N - (ĂN TRƯA, TỐI)</h3>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Hồ Ch&iacute; Minh</p>\r\n\r\n<p>Qu&yacute; kh&aacute;ch tập trung tại Cột 5 ga đi trong nước S&acirc;n bay T&acirc;n Sơn Nhất, hướng dẫn vi&ecirc;n hỗ trợ l&agrave;m thủ tục đ&aacute;p chuyến bay đi Ph&uacute; Y&ecirc;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Ph&uacute; Y&ecirc;n</p>\r\n\r\n<p>Đến s&acirc;n bay Tuy H&ograve;a - Ph&uacute; Y&ecirc;n, hướng dẫn vi&ecirc;n đ&oacute;n Qu&yacute; kh&aacute;ch đi tham quan:</p>\r\n\r\n<p>- Mũi Đại L&atilde;nh: hay c&ograve;n gọi l&agrave; Mũi Điện (điểm cực đ&ocirc;ng của tổ quốc) ở độ cao 110m so với mặt nước biển.&nbsp;</p>\r\n\r\n<p>- B&atilde;i M&ocirc;n: một b&atilde;i biển vẫn c&ograve;n kh&aacute; hoang sơ, c&oacute; h&igrave;nh vầng trăng khuyết với đường bờ biển d&agrave;i khoảng 400m, độ dốc thoai thoải, c&aacute;t trắng mịn, nước trong vắt như pha l&ecirc;.</p>\r\n\r\n<p>- Vịnh Vũng R&ocirc;: nằm tiếp gi&aacute;p với Vịnh V&acirc;n Phong, nơi cập bến của những chuyến t&agrave;u kh&ocirc;ng số với huyền thoại đường Hồ Ch&iacute; Minh tr&ecirc;n biển.&nbsp;</p>\r\n\r\n<p>-&nbsp;<strong>B&atilde;i X&eacute;p</strong>: một trong những b&atilde;i biển hoang sơ v&agrave; đẹp nhất của Ph&uacute; Y&ecirc;n (T&ugrave;y v&agrave;o t&igrave;nh h&igrave;nh thời tiết thực tế của ng&agrave;y tham quan, Vietravel sẽ sắp xếp cho Qu&yacute; kh&aacute;ch tắm biển)</p>\r\n\r\n<p>-&nbsp;<strong>G&agrave;nh &Ocirc;ng:</strong>&nbsp;cảnh quay đặc sắc trong bộ phim &ldquo;T&ocirc;i Thấy Hoa V&agrave;ng Tr&ecirc;n Cỏ Xanh&rdquo;&nbsp;</p>\r\n\r\n<p>Đo&agrave;n ăn tối v&agrave; tự do tham quan th&agrave;nh phố Tuy H&ograve;a về đ&ecirc;m. Nghỉ đ&ecirc;m tại Ph&uacute; Y&ecirc;n.&nbsp;&nbsp;</p>\r\n\r\n<p>Lưu tr&uacute;</p>\r\n\r\n<p>Nghỉ đ&ecirc;m tại Ph&uacute; Y&ecirc;n.&nbsp;&nbsp;</p>\r\n\r\n<h3>NG&Agrave;Y 2 - PH&Uacute; Y&Ecirc;N - QUY NHƠN - (ĂN S&Aacute;NG, TRƯA, TỐI)</h3>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Ph&uacute; Y&ecirc;n</p>\r\n\r\n<p>Qu&yacute; kh&aacute;ch trả ph&ograve;ng, đo&agrave;n khởi h&agrave;nh đi tham quan:</p>\r\n\r\n<p>- G&agrave;nh Đ&aacute; Dĩa: thắng cảnh độc nhất v&ocirc; nhị của tỉnh Ph&uacute; Y&ecirc;n v&agrave; của Quốc Gia.</p>\r\n\r\n<p>- Tr&ecirc;n đường đi Qu&yacute; kh&aacute;ch c&ograve;n được chi&ecirc;m ngưỡng cảnh Đầm &Ocirc; Loan.</p>\r\n\r\n<p>- Nh&agrave; Thờ Mằng Lăng: nơi c&ograve;n lưu giữ cuốn kinh th&aacute;nh bằng chữ Quốc Ngữ đầu ti&ecirc;n của Việt Nam.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Quy Nhơn</p>\r\n\r\n<p>Đo&agrave;n khởi h&agrave;nh đi Quy Nhơn. Buổi chiều, đo&agrave;n tham quan:&nbsp;</p>\r\n\r\n<p>- Khu du lịch Ghềnh R&aacute;ng Ti&ecirc;n Sa, viếng Mộ H&agrave;n Mặc Tử.&nbsp;</p>\r\n\r\n<p>- B&atilde;i Trứng (B&atilde;i tắm Ho&agrave;ng Hậu): với h&agrave;ng ng&agrave;n vi&ecirc;n đ&aacute; khổng lồ h&igrave;nh d&aacute;ng độc đ&aacute;o, du kh&aacute;ch sẽ c&oacute; được cảm gi&aacute;c tuyệt vời khi giẫm b&agrave;n ch&acirc;n trần l&ecirc;n những vi&ecirc;n đ&aacute; tr&ograve;n, nhẵn như trứng chim khổng lồ, nằm xếp l&ecirc;n nhau tr&ecirc;n b&atilde;i biển,&hellip;</p>\r\n\r\n<p>-&nbsp;<strong>Eo Gi&oacute;</strong>: nơi vẫn c&ograve;n giữ được cho m&igrave;nh vẻ đẹp tự nhi&ecirc;n đầy hoang sơ. Đứng từ tr&ecirc;n c&aacute;c mỏm đ&aacute; xung quanh nh&igrave;n xuống bạn sẽ thấy một eo biển nhỏ được che chắn bởi hai d&atilde;y n&uacute;i như một v&ograve;ng tay &ocirc;m gọn b&atilde;i biển tạo th&agrave;nh một eo biển h&uacute;t gi&oacute; tuyệt đẹp.&nbsp;</p>\r\n\r\n<p>Đo&agrave;n ăn tối, nhận ph&ograve;ng v&agrave; tự do kh&aacute;m ph&aacute; th&agrave;nh phố về đ&ecirc;m với c&aacute;c qu&aacute;n c&agrave; ph&ecirc; nổi tiếng check in đẹp tại Quy Nhơn: Surf Bar, S- Blue Caf&eacute;, Mộc Tr&agrave; Caf&eacute;&hellip;hoặc thưởng thức hải sản tại phố ẩm thực Xu&acirc;n Diệu, khu hồ sinh th&aacute;i nổi tiếng với m&oacute;n: bọ biển, cua Huỳnh Đế v&agrave; c&aacute;c loại ốc đặc trưng của v&ugrave;ng biển Quy Nhơn (chi ph&iacute; tự t&uacute;c).&nbsp; Nghỉ đ&ecirc;m tại Quy Nhơn.</p>\r\n\r\n<p>Lưu tr&uacute;</p>\r\n\r\n<p>Nghỉ đ&ecirc;m tại Quy Nhơn.</p>\r\n\r\n<h3>NG&Agrave;Y 3 - QUY NHƠN - TP.HỒ CH&Iacute; MINH - (ĂN S&Aacute;NG)</h3>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Quy Nhơn</p>\r\n\r\n<p>Qu&yacute; kh&aacute;ch ăn s&aacute;ng v&agrave; tự do nghỉ ngơi. Đến giờ trả ph&ograve;ng, đo&agrave;n đi tham quan:&nbsp;</p>\r\n\r\n<p>- Ch&ugrave;a Thi&ecirc;n Hưng: nơi hiện đang lưu giữ Ngọc X&aacute; Lợi của Phật Tổ Th&iacute;ch Ca M&acirc;u Ni, được xem l&agrave; một trong những ng&ocirc;i ch&ugrave;a nổi tiếng bậc nhất tại B&igrave;nh Định, điểm tham quan kh&ocirc;ng thể bỏ qua.</p>\r\n\r\n<p>Sau đ&oacute;, xe đưa đo&agrave;n ra s&acirc;n bay Ph&ugrave; C&aacute;t - Quy Nhơn, đ&aacute;p chuyến bay về TP.Hồ Ch&iacute; Minh.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Hồ Ch&iacute; Minh</p>\r\n\r\n<p>Chia tay Qu&yacute; kh&aacute;ch v&agrave; kết th&uacute;c chương tr&igrave;nh tại s&acirc;n bay T&acirc;n Sơn Nhất.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>***Ghi ch&uacute;:</strong>&nbsp;T&ugrave;y v&agrave;o giờ bay, điểm tham quan c&oacute; thể sắp xếp lại cho ph&ugrave; hợp m&agrave; vẫn bảo đảm đầy đủ nội dung của từng chương tr&igrave;nh. Trong trường hợp giờ bay về đo&agrave;n bay buổi chiều sau 16:00 Vietravel tặng tham quan Bảo t&agrave;ng Quang Trung v&agrave; ăn trưa.&nbsp;</p>\r\n\r\n<p>Lưu tr&uacute;</p>\r\n\r\n<p>Kết th&uacute;c chương tr&igrave;nh&nbsp;</p>', '5990000', 'phuyen30.jpg', 1, NULL, NULL),
(8, 'Phú Quốc - Thiên Đường Giải Trí Vinpearl Land (Đã bao gồm vé Khu Vui Chơi Vinpearl Land) (Khách sạn 3*, Bay Vietnam Airlines, Tour Tiết Kiệm)', 4, 'Tp Hồ Chí Minh', 'Phú Quốc', '2020-02-20', '2020-02-23', '<p>3 ng&agrave;y</p>', '<h3>NG&Agrave;Y 1 - TP.HCM - PH&Uacute; QUỐC (1 BỮA CHIỀU) (TRONG TRƯỜNG HỢP BAY TRƯỚC 11H, VIETRAVEL SẼ HỖ TRỢ BỮA ĂN TRƯA)</h3>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Hồ Ch&iacute; Minh</p>\r\n\r\n<p>Qu&yacute; kh&aacute;ch tập trung tại S&acirc;n bay T&acirc;n Sơn Nhất, Ga đi Trong Nước. Hướng dẫn vi&ecirc;n l&agrave;m thủ tục cho Qu&yacute; kh&aacute;ch đ&aacute;p chuyến bay đi Ph&uacute; Quốc.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Ph&uacute; Quốc</p>\r\n\r\n<p>Xe đ&oacute;n đo&agrave;n tại s&acirc;n bay đưa Qu&yacute; kh&aacute;ch khởi h&agrave;nh viếng Ch&ugrave;a Sư Mu&ocirc;n (H&ugrave;ng Long Tự) &ndash; để cầu nguyện sự an l&agrave;nh v&agrave; hạnh ph&uacute;c đến với gia đ&igrave;nh. Sau đ&oacute; đo&agrave;n khởi h&agrave;nh đi xuy&ecirc;n rừng nguy&ecirc;n sinh kh&aacute;m ph&aacute; Suối Tranh (t&ugrave;y theo m&ugrave;a) - bắt đầu từ d&atilde;y H&agrave;m Ninh xanh thẳm, từ trong khe n&uacute;i nhiều d&ograve;ng suối nhỏ len lỏi chảy qua rừng c&acirc;y, khe đ&aacute; để c&ugrave;ng ho&agrave; m&igrave;nh v&agrave;o d&ograve;ng ch&iacute;nh tạo n&ecirc;n d&ograve;ng Suối Tranh hiền ho&agrave;. Tiếp tục, đo&agrave;n tham quan L&agrave;ng Ch&agrave;i H&agrave;m Ninh, Vườn Ti&ecirc;u, Nh&agrave; Th&ugrave;ng l&agrave;m nước mắm. Qu&yacute; kh&aacute;ch gh&eacute; thăm Dinh Cậu - biểu tượng văn ho&aacute; v&agrave; t&iacute;n ngưỡng của đảo Ph&uacute; Quốc, l&agrave; nơi cầu may mắn, cầu an l&agrave;nh v&agrave; l&agrave; nơi ngư d&acirc;n địa phương gởi gắm niềm tin cho một chuyến ra khơi đ&aacute;nh bắt đầy ắp c&aacute; khi trở về. Sau đ&oacute; nhận ph&ograve;ng kh&aacute;ch sạn, Qu&yacute; kh&aacute;ch tự do nghỉ ngơi v&agrave; tắm biển. Buổi tối, Qu&yacute; kh&aacute;ch tự do dạo phố biển hoặc thưởng thức hải sản tại chợ Đ&ecirc;m Ph&uacute; Quốc (chi ph&iacute; tự t&uacute;c). Nghỉ đ&ecirc;m tại Ph&uacute; Quốc.</p>\r\n\r\n<p>Lưu tr&uacute;</p>\r\n\r\n<p>Nghỉ đ&ecirc;m tại Ph&uacute; Quốc.</p>\r\n\r\n<h3>NG&Agrave;Y 2 - PH&Uacute; QUỐC &ndash; VINPEARL LAND - 2 BỮA (S&Aacute;NG, TRƯA, BỮA CHIỀU TỰ T&Uacute;C)</h3>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Ph&uacute; Quốc</p>\r\n\r\n<p>Sau khi ăn s&aacute;ng, Qu&yacute; kh&aacute;ch tự do nghỉ ngơi vui chơi tắm hồ bơi tại kh&aacute;ch sạn. Trưa hướng dẫn vi&ecirc;n đ&oacute; Qu&yacute; kh&aacute;ch d&ugrave;ng bữa trưa, sau đ&oacute; đưa Qu&yacute; kh&aacute;ch đến với Khu vui chơi giải tr&iacute; Vinpearl Land (Chi ph&iacute; đ&atilde; bao gồm) rộng lớn với đầy đủ những tr&ograve; chơi d&agrave;nh cho mọi lứa tuổi v&agrave; sở th&iacute;ch. Nơi đ&acirc;y hội đủ tất cả c&aacute;c tr&ograve; chơi trong nh&agrave;, ngo&agrave;i trời như: đĩa bay, đu quay con ong, cốc xoay, đĩa quay si&ecirc;u tốc, cối xay gi&oacute;,&hellip; Khu c&ocirc;ng vi&ecirc;n nước với c&aacute;c tr&ograve; chơi hấp dẫn như: boomerang khổng lồ, đường trượt si&ecirc;u l&ograve;ng chảo, d&ograve;ng s&ocirc;ng lười, l&acirc;u đ&agrave;i, bể tạo s&oacute;ng&hellip;&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Ph&uacute; Quốc</p>\r\n\r\n<p>Tiếp tục Qu&yacute; kh&aacute;ch c&oacute; thể kh&aacute;m ph&aacute; Khu Thủy Cung với h&agrave;ng trăm lo&agrave;i c&aacute; v&agrave; sinh vật biển kỳ th&uacute; như: c&aacute; Hải tượng, c&aacute; Sấu hỏa tiễn với chiếc m&otilde;m d&agrave;i v&agrave; hung dữ hay những lo&agrave;i qu&yacute; hiếm như c&aacute; Nemo, c&aacute; Napoleon, c&aacute; Mập trắng, cua King Crab&hellip;. Hơn nữa, ở đ&acirc;y&nbsp; c&ograve;n c&oacute; Rạp chiếu phim 5D, S&acirc;n khấu nhạc nước. Xe đưa Qu&yacute; kh&aacute;ch về lại Kh&aacute;ch sạn. Nghỉ đ&ecirc;m tại Ph&uacute; Quốc.</p>\r\n\r\n<p>Lưu tr&uacute;</p>\r\n\r\n<p>Nghỉ đ&ecirc;m tại Ph&uacute; Quốc.</p>\r\n\r\n<h3>NG&Agrave;Y 3 - PH&Uacute; QUỐC - TP.HCM &ndash; (1 BỮA S&Aacute;NG) (TRONG TRƯỜNG HỢP CHUYẾN BAY SAU 13H VIETRAVEL SẼ TẶNG QU&Yacute; KH&Aacute;CH 1 BỮA TRƯA)</h3>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Ph&uacute; Quốc</p>\r\n\r\n<p>Qu&yacute; kh&aacute;ch tự do tắm biển nghỉ ngơi tại kh&aacute;ch sạn cho đến giờ l&agrave;m thủ tục trả ph&ograve;ng. Sau đ&oacute;, xe đưa Qu&yacute; kh&aacute;ch ra s&acirc;n bay đ&aacute;p chuyến bay trở về Tp.HCM.&nbsp;</p>\r\n\r\n<p>Hồ Ch&iacute; Minh</p>\r\n\r\n<p>Chia tay Qu&yacute; kh&aacute;ch v&agrave; kết th&uacute;c chương tr&igrave;nh du lịch tại s&acirc;n bay T&acirc;n Sơn Nhất.</p>\r\n\r\n<p>Lưu tr&uacute;</p>\r\n\r\n<p>Kết th&uacute;c chương tr&igrave;nh du lịch</p>', '7960000', 'phuquoc8.jpg', 1, NULL, NULL),
(9, 'Đài Bắc - Nam Đầu - Đài Trung - Cao Hùng (Lễ hội thả đèn dịp Tết Nguyên Tiêu, Khách sạn 3 sao, Tour Giá Sốc)', 5, 'Tp Hồ Chí Minh', 'Trung Quốc', '2020-02-14', '2020-02-19', '<p>5 ng&agrave;y</p>', '<h3>NG&Agrave;Y 1 - TP. HỒ CH&Iacute; MINH &ndash; Đ&Agrave;O VI&Ecirc;N &ndash; Đ&Agrave;I BẮC (ĂN TRƯA, TỐI)</h3>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Hồ Ch&iacute; Minh</p>\r\n\r\n<p>Hướng dẫn vi&ecirc;n Vietravel đ&oacute;n Qu&yacute; kh&aacute;ch tại s&acirc;n bay T&acirc;n Sơn Nhất đ&aacute;p chuyến bay đến s&acirc;n bay quốc tế Đ&agrave;o Vi&ecirc;n.</p>\r\n\r\n<p>Đ&agrave;o Vi&ecirc;n</p>\r\n\r\n<p>Đến nơi, xe v&agrave; hướng dẫn vi&ecirc;n địa phương đ&oacute;n Qu&yacute; kh&aacute;ch tại s&acirc;n bay, ăn fastfood tr&ecirc;n xe. Đo&agrave;n tham quan Trung t&acirc;m Thương mại của t&ograve;a cao ốc 101 &ndash; từng l&agrave; to&agrave; th&aacute;p cao nhất Thế giới v&agrave; l&agrave; biểu tượng cho sự ph&aacute;t triển thịnh vượng của Đ&agrave;i Loan (kh&ocirc;ng bao gồm chi ph&iacute; đi thang m&aacute;y l&ecirc;n th&aacute;p). Qu&yacute; kh&aacute;ch tham quan Quảng trường tự do Khu tưởng niệm Tưởng Giới Thạch (CKS Memorial Hall) - c&ocirc;ng tr&igrave;nh n&agrave;y nhằm thể hiện sự t&ocirc;n k&iacute;nh với một trong những nh&agrave; l&atilde;nh đạo quyền lực nhất của thế kỷ thứ 20. Khu nh&agrave; tao nh&atilde; n&agrave;y nằm giữa 25 hecta vườn v&agrave; lối đi bộ, được x&acirc;y dựng từ đ&aacute; cẩm thạch trắng với m&aacute;i ng&oacute;i m&agrave;u xanh tr&ecirc;n nền m&agrave;u đỏ. Qu&yacute; kh&aacute;ch viếng cảnh ch&ugrave;a Long Sơn &ndash; một ng&ocirc;i ch&ugrave;a nổi tiếng theo trường ph&aacute;i Nho &ndash; Phật &ndash; Đạo của Đ&agrave;i Loan.&nbsp; H&agrave;ng năm c&oacute; rất nhiều người h&agrave;nh hương từ khắp nơi đến viếng ch&ugrave;a. Buổi tối, đo&agrave;n ăn tối v&agrave; tự do dạo phố đi bộ T&acirc;y M&ocirc;n, mỗi kh&aacute;ch được tặng 1 ly tr&agrave; sữa để thưởng thức &ndash; loại nước uống nổi tiếng của Đ&agrave;i Loan.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Đ&agrave;i Bắc</p>\r\n\r\n<p>Nhận ph&ograve;ng kh&aacute;ch sạn nghỉ ngơi tại Đ&agrave;i Bắc.</p>\r\n\r\n<p>Lưu tr&uacute;</p>\r\n\r\n<p>Nhận ph&ograve;ng kh&aacute;ch sạn nghỉ ngơi tại Đ&agrave;i Bắc.</p>\r\n\r\n<h3>NG&Agrave;Y 2 - Đ&Agrave;I BẮC (ĂN BA BỮA)</h3>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Đ&agrave;i Bắc</p>\r\n\r\n<p>Ăn s&aacute;ng tại kh&aacute;ch sạn v&agrave; trả ph&ograve;ng. Đo&agrave;n tham quan mua sắm cửa h&agrave;ng tỳ hưu. Tiếp tục tham quan chụp ảnh Vườn hoa v&agrave; kh&aacute;ch sạn Vi&ecirc;n Sơn của b&agrave; Tống Mỹ Linh nổi tiếng với 250 ng&agrave;n h&igrave;nh chạm khắc hoặc tranh vẽ h&igrave;nh rồng được sử dụng để trang tr&iacute; cả b&ecirc;n trong v&agrave; b&ecirc;n ngo&agrave;i kh&aacute;ch sạn, khiến nơi đ&acirc;y nổi tiếng với c&aacute;i t&ecirc;n &ldquo;Cung điện Rồng&rdquo;. Tự do mua sắm ở trung t&acirc;m miễn thuế. Ăn trưa tại nh&agrave; h&agrave;ng. Buổi chiều, đo&agrave;n tham quan C&ocirc;ng vi&ecirc;n địa chất D&atilde; Liễu (Yehliu) - nổi tiếng với những tảng đ&aacute; c&oacute; h&igrave;nh dạng kỳ lạ, những di t&iacute;ch h&oacute;a thạch c&oacute; gi&aacute; trị lịch sử. Qu&yacute; kh&aacute;ch tham quan L&agrave;ng cổ Cửu Phần (Jiufen) - l&agrave; một ng&ocirc;i l&agrave;ng nhỏ tọa lạc tr&ecirc;n ngọn n&uacute;i Keelung c&aacute;ch Taipei khoảng 50km. L&agrave;ng cổ nhỏ b&eacute; n&agrave;y c&oacute; từ thời nh&agrave; Thanh, c&aacute;i t&ecirc;n Cửu Phần bắt nguồn từ việc ban đầu ở đ&acirc;y chỉ c&oacute; 9 hộ d&acirc;n sinh sống. L&agrave;ng Cửu Phần ng&agrave;y nay l&agrave; 1 m&ecirc; cung của những hẻm nhỏ, những con đường với sắc m&agrave;u văn h&oacute;a đặc biệt v&agrave; l&agrave; &ldquo;thi&ecirc;n đường ăn vặt&rdquo;. Đi bộ trong l&agrave;ng l&agrave; một trong những trải nghiệm th&uacute; vị v&agrave; b&igrave;nh y&ecirc;n nhất m&agrave; bạn c&oacute; thể t&igrave;m thấy. N&oacute;i tới l&agrave;ng cổ Cửu Phần th&igrave; phải nhắc đến bộ phim Đ&agrave;i Loan City of Sadness, l&agrave; bộ phim đầu ti&ecirc;n l&agrave;m cho ng&ocirc;i l&agrave;ng trở n&ecirc;n nổi tiếng.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Đ&agrave;i Bắc</p>\r\n\r\n<p>Sau bữa tối, đo&agrave;n tham gia Lễ hội thả đ&egrave;n trời tại Đ&agrave;i Bắc, lễ hội đ&egrave;n lồng ở Đ&agrave;i Loan chứa đựng rất nhiều sắc th&aacute;i &yacute; nghĩa đặc biệt. Lễ hội đ&egrave;n lồng với c&aacute;c hoạt động rước đ&egrave;n, thả đ&egrave;n trời, bắn ph&aacute;o hoa&hellip;đều thể hiện mong muốn vươn cao, cầu mong may mắn, sung t&uacute;c sẽ đến với người d&acirc;n. Mọi người Đ&agrave;i Loan đều tin rằng, khi thả đ&egrave;n bay l&ecirc;n trời, hạnh ph&uacute;c v&agrave; may mắn sẽ tới. Sau đ&oacute; di chuyển về kh&aacute;ch sạn nhận ph&ograve;ng nghỉ ngơi tại T&acirc;n Bắc.</p>\r\n\r\n<p>Lưu tr&uacute;</p>\r\n\r\n<p>Nhận ph&ograve;ng nghỉ ngơi tại T&acirc;n Bắc.</p>\r\n\r\n<h3>NG&Agrave;Y 3 - Đ&Agrave;I BẮC &ndash; Đ&Agrave;I TRUNG (ĂN BA BỮA)</h3>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Đ&agrave;i Bắc</p>\r\n\r\n<p>Ăn s&aacute;ng v&agrave; trả ph&ograve;ng kh&aacute;ch sạn. Đo&agrave;n di chuyển đi Nam Đầu.&nbsp;</p>\r\n\r\n<p>Nam Đầu</p>\r\n\r\n<p>Đo&agrave;n tham quan mua sắm đặc sản nấm linh chi. Qu&yacute; kh&aacute;ch xuống t&agrave;u du ngoạn Nhật Nguyệt Đ&agrave;m - hồ nước thi&ecirc;n nhi&ecirc;n lớn nhất Đ&agrave;i Loan gồm một hồ lớn v&agrave; một hồ nhỏ liền nhau, được bao bọc bởi m&agrave;u xanh bạt ng&agrave;n của những d&atilde;y n&uacute;i xung quanh, từng l&agrave; điểm nghỉ dưỡng ưng &yacute; nhất của Tưởng Giới Thạch. Sau đ&oacute;, đo&agrave;n viếng Văn V&otilde; Miếu (Wen Wu Temple) - nằm ở ph&iacute;a Bắc hồ Nhật Nguyệt c&oacute; tượng sư tử đỏ to lớn uy nghi trấn cửa, b&ecirc;n trong Văn Miếu thờ Khổng Tử v&agrave; hai đồ đệ của &ocirc;ng, l&agrave; Mạnh Tử v&agrave; Zihsih, c&ograve;n V&otilde; Miếu thờ Quan C&ocirc;ng v&agrave; Nhạc Phi - một danh tướng y&ecirc;u nước thời Tống. Tiếp đến, đo&agrave;n gh&eacute; thăm cửa h&agrave;ng tr&agrave; &Ocirc; Long nổi tiếng của Đ&agrave;i Loan. Ăn tối tại nh&agrave; h&agrave;ng.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Đ&agrave;i Trung</p>\r\n\r\n<p>Sau đ&oacute; tự do tham dự Lễ hội đ&egrave;n lồng Đ&agrave;i Trung Lantern Festival Taichung, chi&ecirc;m ngưỡng những chiếc đ&egrave;n lồng khổng lồ rực rỡ bởi nghệ nh&acirc;n xứ Đ&agrave;i, Qu&yacute; kh&aacute;ch sẽ c&oacute; cơ hội trải nghiệm viết những điều ước, cầu mong ph&uacute;c l&agrave;nh l&ecirc;n đ&egrave;n v&agrave; thả l&ecirc;n trời. Nhận ph&ograve;ng kh&aacute;ch sạn nghỉ ngơi tại Đ&agrave;i Trung.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Lưu &yacute;:</strong>&nbsp;C&aacute;c đo&agrave;n khởi h&agrave;nh từ ng&agrave;y 01/02/2020&nbsp; &ndash; 08/02/2020 sẽ thay thế tham quan du thuyền Hồ Nhật Nguyệt th&agrave;nh tham quan L&agrave;ng Văn H&oacute;a Cửu Tộc - Trải nghiệm dịch vụ c&aacute;p treo ngắm nh&igrave;n hồ Nhật Nguyệt từ tr&ecirc;n cao v&agrave; di chuyển v&agrave;o l&agrave;ng văn h&oacute;a Cửu Tộc ngắm hoa anh Đ&agrave;o (T&ugrave;y v&agrave;o t&igrave;nh h&igrave;nh thời tiết)</p>\r\n\r\n<h3>NG&Agrave;Y 4 - Đ&Agrave;I TRUNG &ndash; CAO H&Ugrave;NG (ĂN BA BỮA)</h3>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Đ&agrave;i Trung</p>\r\n\r\n<p>Ăn s&aacute;ng v&agrave; trả ph&ograve;ng.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Cao H&ugrave;ng</p>\r\n\r\n<p>Xe đưa đo&agrave;n tham quan Phật Quang Sơn Tự - được xem l&agrave; &quot;Thủ đ&ocirc; Phật gi&aacute;o Đ&agrave;i Loan&quot;, l&agrave; th&aacute;nh địa phật gi&aacute;o cực kỳ nổi tiếng với lối kiến tr&uacute;c v&ocirc; c&ugrave;ng h&ugrave;ng vĩ. Tham quan khu mới, Qu&yacute; kh&aacute;ch sẽ được chi&ecirc;m ngưỡng tượng pho tượng Phật cao sừng sững với nụ cười hiền từ tr&ecirc;n nền trời xanh v&agrave; hai h&agrave;ng bảo th&aacute;p l&agrave;m n&ecirc;n hai tường th&agrave;nh che chở cho con đường đến với phật. Phật Quang Sơn l&agrave; nơi sở hữu h&agrave;ng ng&agrave;n pho tượng Phật d&aacute;t v&agrave;ng qu&yacute; gi&aacute;. Bảo t&agrave;ng Phật Gi&aacute;o - với kiến tr&uacute;c lộng lẫy được x&acirc;y dựng ngay s&aacute;t Phật Quang Sơn tr&ocirc;ng bề thế kh&ocirc;ng k&eacute;m ng&ocirc;i ch&ugrave;a. Ở ch&iacute;nh giữa quảng trường của bảo t&agrave;ng l&agrave; hai h&agrave;ng th&aacute;p dẫn đến bức tượng Phật uy nghi&ecirc;m đang mỉm cười. Tham quan Hồ Sen, Xu&acirc;n Thu C&aacute;c v&agrave; Long Hổ Th&aacute;p. Ăn trưa tại nh&agrave; h&agrave;ng. . Qu&yacute; kh&aacute;ch c&oacute; cơ hội trải nghiệm l&agrave;m b&aacute;nh dứa &ndash; m&oacute;n ăn đặc sản xứ Đ&agrave;i. Tự do tham quan Trung t&acirc;m thương mại Dream Mall. Sau bữa tối, tự do mua sắm kh&aacute;m ph&aacute; chợ đ&ecirc;m Lục Hợp. Nhận ph&ograve;ng kh&aacute;ch sạn tại Cao H&ugrave;ng.</p>\r\n\r\n<p>Lưu tr&uacute;</p>\r\n\r\n<p>Nhận ph&ograve;ng kh&aacute;ch sạn tại Cao H&ugrave;ng.</p>\r\n\r\n<h3>NG&Agrave;Y 5 - CAO H&Ugrave;NG &ndash; TP. HỒ CH&Iacute; MINH (ĂN S&Aacute;NG, TRƯA)</h3>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Cao H&ugrave;ng</p>\r\n\r\n<p>Ăn s&aacute;ng tại kh&aacute;ch sạn v&agrave; trả ph&ograve;ng. Đo&agrave;n tham quan Nh&agrave; ga Formosa Boulevard - ga t&agrave;u điện ngầm h&igrave;nh v&ograve;m lớn nhất thế giới, nhiều lần được bầu chọn l&agrave; một trong những ga t&agrave;u đẹp nhất to&agrave;n cầu. &quot;M&aacute;i v&ograve;m &aacute;nh s&aacute;ng&quot; sử dụng nghệ thuật Domelight được hợp th&agrave;nh bởi 4.500 tấm k&iacute;nh, l&agrave; t&aacute;c phẩm nghệ thuật v&ocirc; c&ugrave;ng ho&agrave;nh tr&aacute;ng v&agrave; đẹp mắt. Tự do mua sắm tại Trung t&acirc;m đ&aacute; qu&yacute;. Khởi h&agrave;nh ra s&acirc;n bay, d&ugrave;ng bữa trưa fast food. Đ&oacute;n chuyến bay về lại Việt Nam.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Hồ Ch&iacute; Minh</p>\r\n\r\n<p>Về đến s&acirc;n bay T&acirc;n Sơn Nhất, kết th&uacute;c chuyến tham quan. Hẹn gặp lại Qu&yacute; kh&aacute;ch trong những chương tr&igrave;nh tiếp theo của Vietravel.</p>\r\n\r\n<p>Lưu tr&uacute;</p>\r\n\r\n<p>Kết th&uacute;c chuyến tham quan</p>', '12990000', 'tq144.jpg', 1, NULL, NULL),
(10, 'Fukushima - Tokyo - Núi Phú Sĩ - Fukushima (Một ngày tự do, Chuyến bay thuê bao cùng hàng không Bamboo, Tour Tiêu Chuẩn)', 5, 'Tp Hồ Chí Minh', 'Nhật Bản', '2020-02-12', '2020-02-17', '<p>5 ng&agrave;y</p>', '<h3>NG&Agrave;Y 1 - TP.HCM - FUKUSHIMA (ĂN TRƯA, TỐI)</h3>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Hồ Ch&iacute; Minh</p>\r\n\r\n<p>Đ&ecirc;m trước ng&agrave;y 1: Qu&yacute; kh&aacute;ch tập trung tại s&acirc;n bay T&acirc;n Sơn Nhất, l&agrave;m thủ tục đ&oacute;n chuyến bay đi Fukushima, Nhật Bản.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Nhật Bản</p>\r\n\r\n<p>Đến s&acirc;n bay FKS (Fukushima), xe v&agrave; hướng dẫn vi&ecirc;n đ&oacute;n đo&agrave;n đi tham quan:</p>\r\n\r\n<p>&bull; Th&agrave;nh Hạc trắng Tsurugajo: ki&ecirc;u sa với bốn bức tường trắng muốt bao phủ, du kh&aacute;ch c&oacute; thể dạo bộ tham quan hoặc leo l&ecirc;n c&aacute;c tầng đ&agrave;i, ngắm nh&igrave;n to&agrave;n cảnh thi&ecirc;n nhi&ecirc;n h&ugrave;ng vĩ xung quanh.&nbsp;</p>\r\n\r\n<p>&bull; Dinh thự của c&aacute;c v&otilde; sĩ đạo v&ugrave;ng Aizu - Dinh thự l&agrave; một t&ograve;a kiến tr&uacute;c tr&aacute;ng lệ được x&acirc;y từ c&acirc;y tuyết t&ugrave;ng, c&acirc;y Keyaki v&agrave; Hinoki tr&ecirc;n khu đất rộng 2400 m2.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Buổi chiều, đo&agrave;n tham quan:</p>\r\n\r\n<p>&bull;&nbsp;<strong>Thị trấn cổ Ouchijuku</strong>: nơi vẫn c&ograve;n lưu giữ được khu phố thời Edo (1603-1868). Khu phố gồm hơn 50 căn nh&agrave; lợp m&aacute;i tranh nằm dọc 2 b&ecirc;n đường, hiện được chỉ định l&agrave; khu vực bảo tồn kiến tr&uacute;c truyền thống quan trọng của quốc gia.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Qu&yacute; kh&aacute;ch d&ugrave;ng cơm tối v&agrave; nhận ph&ograve;ng kh&aacute;ch sạn, tự do kh&aacute;m ph&aacute; th&agrave;nh phố Fukushima về đ&ecirc;m.</p>\r\n\r\n<p>∆ Khoảng c&aacute;ch cung đường:</p>\r\n\r\n<p>&times; S&acirc;n bay Fukushima &ndash; Th&agrave;nh Hạc trắng Tsurugajo (~87km)</p>\r\n\r\n<p>&times; Th&agrave;nh Hạc trắng Tsurugajo &ndash; Dinh thự của c&aacute;c v&otilde; sĩ đạo v&ugrave;ng Aizu&nbsp; (~5km)</p>\r\n\r\n<p>&times; Dinh thự của c&aacute;c v&otilde; sĩ đạo v&ugrave;ng Aizu&nbsp; &ndash; Thị trấn cổ Ouchijuku (~31km)</p>\r\n\r\n<p>&times; Thị trấn cổ Ouchijuku &ndash; Fukushima (~58km)</p>\r\n\r\n<p>Lưu tr&uacute;</p>\r\n\r\n<p>Tự do kh&aacute;m ph&aacute; th&agrave;nh phố Fukushima về đ&ecirc;m.</p>\r\n\r\n<h3>NG&Agrave;Y 2 - FUKUSHIMA &ndash; TOKYO (ĂN BA BỮA)</h3>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Nhật Bản</p>\r\n\r\n<p>D&ugrave;ng điểm t&acirc;m s&aacute;ng tại kh&aacute;ch sạn v&agrave; l&agrave;m thủ tục trả ph&ograve;ng. Xe đ&oacute;n qu&yacute; kh&aacute;ch khởi h&agrave;nh đến th&agrave;nh phố Tokyo, d&ugrave;ng cơm trưa v&agrave; tham quan:</p>\r\n\r\n<p>&bull; Hồ Inawashiro: với những cảnh sắc bốn m&ugrave;a tr&ecirc;n n&uacute;i Bandai in sắc xuống mặt hồ tuyệt đẹp.</p>\r\n\r\n<p>&bull; Ch&ugrave;a Asakusa: ng&ocirc;i ch&ugrave;a đẹp v&agrave; cổ xưa nhất nhất Nhật Bản, nơi diễn ra nhiều sự kiện lễ hội quanh năm.</p>\r\n\r\n<p>&bull; Tham quan b&ecirc;n ngo&agrave;i Ho&agrave;ng Cung Tokyo:&nbsp; nơi sinh sống của Nhật Ho&agrave;ng c&ugrave;ng gia đ&igrave;nh - nổi tiếng với những khu vườn tuyệt đẹp c&ugrave;ng n&eacute;t kiến tr&uacute;c cổ k&iacute;nh, đậm n&eacute;t Nhật Bản.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Nhật Bản</p>\r\n\r\n<p>Sau khi tham quan, đo&agrave;n di chuyển đến quận Ginza, Tokyo. Tự do mua sắm tại khu Ginza nhộn nhịp sầm uất với c&aacute;c cửa h&agrave;ng mua sắm nổi tiếng của Nhật như: Don Quijote - mua sắm b&aacute;nh kẹo, mỹ phẩm, qu&agrave; lưu niệm hay Cửa h&agrave;ng miễn thuế LAOX b&aacute;n nhiều loại mặt h&agrave;ng kh&aacute;c nhau, từ đồ gia dụng đến tr&ograve; chơi điện tử, mỹ phẩm... v&agrave; rất nhiều cửa h&agrave;ng thời trang từ b&igrave;nh d&acirc;n cho đến cao cấp đều c&oacute; thể t&igrave;m thấy tại khu Ginza. (Thời gian mua sắm Trưởng Đo&agrave;n Vietravel sẽ sắp xếp linh động t&ugrave;y v&agrave;o thời gian thực tế).</p>\r\n\r\n<p>Nghỉ đ&ecirc;m tại Tokyo, kh&aacute;m ph&aacute; th&agrave;nh phố sầm uất, n&aacute;o nhiệt về đ&ecirc;m</p>\r\n\r\n<p>∆ Khoảng c&aacute;ch cung đường:</p>\r\n\r\n<p>&times; Fukushima &ndash; Hồ Inawashiro (~13km)</p>\r\n\r\n<p>&times; Hồ Inawashiro &ndash; Ch&ugrave;a Asakusa (~287km)</p>\r\n\r\n<p>&times; Ch&ugrave;a Asakusa &ndash; Ho&agrave;ng cung Tokyo (~5km)</p>\r\n\r\n<p>Lưu tr&uacute;</p>\r\n\r\n<p>Nghỉ đ&ecirc;m tại Tokyo, kh&aacute;m ph&aacute; th&agrave;nh phố sầm uất, n&aacute;o nhiệt về đ&ecirc;m</p>\r\n\r\n<h3>NG&Agrave;Y 3 - TỰ DO THAM QUAN TOKYO (ĂN S&Aacute;NG)</h3>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Nhật Bản</p>\r\n\r\n<p>Ăn s&aacute;ng tại kh&aacute;ch sạn. Qu&yacute; kh&aacute;ch tự do tham quan mua sắm qu&agrave; lưu niệm tại c&aacute;c khu mua sắm như hoặc tự do kh&aacute;m ph&aacute; Tokyo.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Nhật Bản</p>\r\n\r\n<p>Qu&yacute; kh&aacute;ch tự t&uacute;c phương tiện di chuyển, kh&ocirc;ng bao gồm bữa ăn trưa v&agrave; ăn tối.</p>\r\n\r\n<p>Lưu tr&uacute;</p>\r\n\r\n<p>Tự do kh&aacute;m ph&aacute; Tokyo</p>\r\n\r\n<h3>NG&Agrave;Y 4 - TOKYO &ndash; N&Uacute;I PH&Uacute; SĨ &ndash; FUKUSHIMA (ĂN BA BỮA)</h3>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Nhật Bản</p>\r\n\r\n<p>Sau bữa s&aacute;ng, Qu&yacute; kh&aacute;ch khởi h&agrave;nh đến tham quan:</p>\r\n\r\n<p>&bull;&nbsp;<strong>L&agrave;ng cổ Oshino Hakkai</strong>: nằm y&ecirc;n b&igrave;nh dưới ch&acirc;n n&uacute;i Ph&uacute; Sĩ. Cho đến ng&agrave;y nay, những ng&ocirc;i nh&agrave; ở l&agrave;ng Oshino Hakkai vẫn mang n&eacute;t kiến tr&uacute;c truyền thống Nhật Bản xa xưa.</p>\r\n\r\n<p>&bull;&nbsp;<strong>N&uacute;i Ph&uacute; Sĩ</strong>&nbsp;(tham quan chụp ảnh tại Trạm 1) - N&uacute;i Ph&uacute; Sĩ từ l&acirc;u đ&atilde; trở th&agrave;nh biểu tượng của đất nước mặt trời mọc, được c&ocirc;ng nhận l&agrave; di sản văn h&oacute;a thế giới.</p>\r\n\r\n<p>&bull;&nbsp;<strong>Hồ Kawaguchi</strong>: hồ nước tuyệt đẹp, được thi&ecirc;n nhi&ecirc;n ban tặng những cảnh sắc t&ugrave;y từng m&ugrave;a trong năm.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Nhật Bản</p>\r\n\r\n<p>D&ugrave;ng cơm trưa tại nh&agrave; h&agrave;ng địa phương, sau đ&oacute; xe đưa qu&yacute; kh&aacute;ch về lại Fukushima, nhận ph&ograve;ng v&agrave; nghỉ ngơi. Qu&yacute; kh&aacute;ch tự do trải nghiệm tắm Onsen (suối nước n&oacute;ng) tại kh&aacute;ch sạn với rất nhiều kho&aacute;ng chất tốt cho l&agrave;n da v&agrave; cơ thể.</p>\r\n\r\n<p>∆&nbsp;<strong>Khoảng c&aacute;ch cung đường</strong>:</p>\r\n\r\n<p>&times; Tokyo &ndash; L&agrave;ng cổ Oshino Hakkai (~130km)</p>\r\n\r\n<p>&times; L&agrave;ng cổ Oshino Hakkai &ndash; N&uacute;i Ph&uacute; Sĩ trạm 1 (~48km)</p>\r\n\r\n<p>&times; N&uacute;i Ph&uacute; Sĩ trạm 1 &ndash;&nbsp; Hồ Kawaguchi (~44km)</p>\r\n\r\n<p>&times; Hồ Kawaguchi &ndash; Fukushima (~357km)</p>\r\n\r\n<p>Lưu tr&uacute;</p>\r\n\r\n<p>Qu&yacute; kh&aacute;ch tự do trải nghiệm tắm Onsen (suối nước n&oacute;ng)&nbsp;</p>\r\n\r\n<h3>NG&Agrave;Y 5 - FUKUSHIMA &ndash; TP HỒ CH&Iacute; MINH (ĂN S&Aacute;NG)</h3>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Nhật Bản</p>\r\n\r\n<p>Qu&yacute; kh&aacute;ch khởi h&agrave;nh ra s&acirc;n bay Fukushima đ&oacute;n chuyến bay về lại TP.HCM.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Hồ Ch&iacute; Minh</p>\r\n\r\n<p>Về đến s&acirc;n bay T&acirc;n Sơn Nhất, kết th&uacute;c chương tr&igrave;nh tham quan. Hẹn gặp lại Qu&yacute; kh&aacute;ch trong những chương tr&igrave;nh sắp tới.</p>\r\n\r\n<p>Lưu tr&uacute;</p>\r\n\r\n<p>Về đến s&acirc;n bay T&acirc;n Sơn Nhất, kết th&uacute;c chương tr&igrave;nh tham quan.</p>', '26990000', '4677b21f-49c1-4920-bbc8-388c01146c6b44.jpg', 1, NULL, NULL),
(11, 'Seoul - Nami - Lotte World - Tháp Namsan', 5, 'Tp Hồ Chí Minh', 'Hàn Quốc', '2020-03-01', '2020-03-02', '<p>5 ng&agrave;y</p>', '<h3>NG&Agrave;Y 1 - TP. HỐ CH&Iacute; MINH - SEOUL: (NGHỈ Đ&Ecirc;M TR&Ecirc;N M&Aacute;Y BAY)</h3>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Hồ Ch&iacute; Minh</p>\r\n\r\n<p>Tại s&acirc;n bay T&acirc;n Sơn Nhất, Qu&yacute; kh&aacute;ch đ&oacute;n chuyến bay đi Seoul - thủ đ&ocirc; H&agrave;n Quốc.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Seoul</p>\r\n\r\n<p>Lưu tr&uacute;</p>\r\n\r\n<p>Nghỉ đ&ecirc;m tr&ecirc;n m&aacute;y bay.</p>\r\n\r\n<h3>NG&Agrave;Y 2 - SEOUL (ĂN BA BỮA)</h3>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Seoul</p>\r\n\r\n<p>Đến Seoul, Qu&yacute; kh&aacute;ch tham quan:&nbsp;</p>\r\n\r\n<p>-&nbsp;Quảng trường Gwanghwawmun&nbsp;- l&agrave; quảng trường lớn v&agrave; đẹp nhất thủ đ&ocirc; Seoul.</p>\r\n\r\n<p>-&nbsp;Cung điện Changdeok&nbsp;- thuộc triều đại Joseon, được UNESCO c&ocirc;ng nhận l&agrave; di sản văn h&oacute;a thế giới v&agrave;o năm 1997.</p>\r\n\r\n<p>- Trải nghiệm mặc hanbok ở cung điện Changdeok</p>\r\n\r\n<p>-&nbsp;Suối nh&acirc;n tạo Cheonggyecheon&nbsp;giữa l&ograve;ng Seoul, được xem như linh hồn của Seoul.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Seoul</p>\r\n\r\n<p>TRẢI NGHIỆM BAO GỒM</p>\r\n\r\n<ul>\r\n	<li>Tham quan &shy;Quảng trường Gwanghwawmun</li>\r\n	<li>Tham quan &shy;Cung điện Changdeok</li>\r\n	<li>Trải nghiệm mặc hanbok ở cung điện Changdeok</li>\r\n	<li>Tham quan Suối nh&acirc;n tạo Cheonggyecheon</li>\r\n</ul>\r\n\r\n<p>Lưu tr&uacute;</p>\r\n\r\n<p>Nghỉ ngơi tại kh&aacute;ch sạn ở Seoul</p>\r\n\r\n<h3>NG&Agrave;Y 3 - SEOUL - ĐẢO NAMI - NANTA SHOW: (ĂN BA BỮA)</h3>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Seoul</p>\r\n\r\n<p>Ăn s&aacute;ng tại kh&aacute;ch sạn.</p>\r\n\r\n<p>Nami</p>\r\n\r\n<p>Tham quan&nbsp;đảo Nami&nbsp;xinh đẹp v&agrave; b&igrave;nh y&ecirc;n bởi hệ thực vật với hơn 200 loại c&acirc;y kh&aacute;c nhau.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Seoul</p>\r\n\r\n<p>Qu&yacute; kh&aacute;ch tham quan:</p>\r\n\r\n<p>-&nbsp;L&agrave;ng Cổ Namsan Hanok&nbsp;- với những ng&ocirc;i nh&agrave; truyền thống của H&agrave;n Quốc nằm dưới ch&acirc;n n&uacute;i&nbsp;Namsan.</p>\r\n\r\n<p>- Mua sắm tại&nbsp;cửa h&agrave;ng nh&acirc;n s&acirc;m,&nbsp;cửa h&agrave;ng mỹ phẩm&nbsp;v&agrave;&nbsp;phố Myeongdong&nbsp;nổi tiếng với những gian h&agrave;ng thời trang.</p>\r\n\r\n<p>- Thưởng thức&nbsp;Chương tr&igrave;nh biểu diễn nghệ thuật đặc sắc Nanta show.</p>\r\n\r\n<p>Lưu tr&uacute;</p>\r\n\r\n<p>Nghỉ ngơi tại kh&aacute;ch sạn ở Seoul</p>\r\n\r\n<h3>NG&Agrave;Y 4 - SEOUL - LOTTE WORLD (ĂN BA BỮA)</h3>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Seoul</p>\r\n\r\n<p>Qu&yacute; kh&aacute;ch tham quan:</p>\r\n\r\n<p>- Mua sắm tại&nbsp;cửa h&agrave;ng Tinh dầu Th&ocirc;ng Đỏ,&nbsp;Cửa h&agrave;ng miễn thuế,&nbsp;cửa h&agrave;ng InSeoul Herb</p>\r\n\r\n<p>-&nbsp;Th&aacute;p N Seoul&nbsp;hay c&ograve;n gọi l&agrave;&nbsp;Namsan N Tower&nbsp;- từ l&acirc;u đ&atilde; trở th&agrave;nh địa điểm nổi tiếng với c&aacute;c cặp t&igrave;nh nh&acirc;n (bao gồm v&eacute; l&ecirc;n th&aacute;p)</p>\r\n\r\n<p>- Vui chơi tại&nbsp;C&ocirc;ng Vi&ecirc;n Lotte World&nbsp;- c&ocirc;ng vi&ecirc;n c&oacute; khu tr&ograve; chơi trong nh&agrave; lớn nhất thế giới.</p>\r\n\r\n<p>- Mua sắm tại&nbsp;Cửa h&agrave;ng Cheng-ha.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Seoul</p>\r\n\r\n<p>Lưu tr&uacute;</p>\r\n\r\n<p>Nghỉ ngơi tại kh&aacute;ch sạn ở Seoul</p>\r\n\r\n<h3>NG&Agrave;Y 5 - SEOUL - TP. HỒ CH&Iacute; MINH: (ĂN S&Aacute;NG NHẸ TR&Ecirc;N M&Aacute;Y BAY)</h3>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Seoul</p>\r\n\r\n<p>Qu&yacute; kh&aacute;ch l&agrave;m thủ tục trả ph&ograve;ng sớm, khởi h&agrave;nh ra s&acirc;n bay Incheon đ&oacute;n chuyến bay trở về Việt Nam.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Hồ Ch&iacute; Minh</p>\r\n\r\n<p>Về đến s&acirc;n bay T&acirc;n Sơn Nhất, kết th&uacute;c chuyến tham quan. Hẹn gặp lại Qu&yacute; kh&aacute;ch trong những chương tr&igrave;nh tiếp theo của TripU.</p>', '13860000', 'hq42.jpg', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_shipping`
--

CREATE TABLE `tbl_shipping` (
  `shipping_id` int(10) UNSIGNED NOT NULL,
  `shipping_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_shipping`
--

INSERT INTO `tbl_shipping` (`shipping_id`, `shipping_name`, `shipping_address`, `shipping_phone`, `shipping_email`, `created_at`, `updated_at`) VALUES
(1, 'Hieu truong', '123/123 TPHCM', '0932023992', 'hieutruong@gmail.com', NULL, NULL),
(2, 'Hieu truong', 'dasdas', '0932023992', 'hieutruong@gmail.com', NULL, NULL),
(3, 'Châu', '123/123 TPHCM', '0932023992', 'chau@gmail.com', NULL, NULL),
(4, 'Hieu truong', '123/123 TPHCM', '0932023992', 'hieutruong@gmail.com', NULL, NULL),
(5, 'Hoàng Sa Trường Sa', '123/123 TPHCM', '0932023992', 'hieutruong@gmail.com', NULL, NULL),
(6, 'Hieu truong', '123/123 TPHCM', '0932023992', 'hieutruong@gmail.com', NULL, NULL),
(7, 'Nguyễn Tấn Lượng', 'Chư Sê', '0329264630', 'nguyenvanluong101@gmail.com', NULL, NULL),
(8, 'Nguyễn Tấn Lượng', 'Chư Sê', '0329264630', 'nguyenvanluong101@gmail.com', NULL, NULL),
(9, 'Nguyễn Tấn Lượng', 'Chư Sê', '0329264630', 'nguyenvanluong101@gmail.com', NULL, NULL),
(10, 'Nguyễn Tấn Lượng', 'Chư Sê', '0329264630', 'nguyenvanluong101@gmail.com', NULL, NULL),
(11, 'Nguyễn Tấn Lượng', 'Chư Sê', '0329264630', 'nguyenvanluong101@gmail.com', NULL, NULL),
(12, 'Nguyễn Tấn Lượng', 'Chư Sê', '0329264630', 'nguyenvanluong101@gmail.com', NULL, NULL),
(13, 'Nguyễn Tấn Lượng', 'Chư Sê', '0329264630', 'nguyenvanluong101@gmail.com', NULL, NULL),
(14, 'Nguyễn Tấn Lượng', 'Chư Sê', '0329264630', 'nguyenvanluong101@gmail.com', NULL, NULL),
(15, 'Nguyễn Tấn Lượng', 'Chư Sê', '0329264630', 'nguyenvanluong101@gmail.com', NULL, NULL),
(16, 'Nguyễn Tấn Lượng', 'Chư Sê', '0329264630', 'nguyenvanluong101@gmail.com', NULL, NULL),
(17, 'Nguyễn Tấn Lượng', 'Chư Sê', '0329264630', 'nguyenvanluong101@gmail.com', NULL, NULL),
(18, 'Nguyễn Tấn Lượng', 'Gia Lai', '0329264630', 'ntluong@gmail.com', NULL, NULL),
(19, 'Nguyễn Tấn Lượng', 'Gia Lai', '0329264630', 'ntluong@gmail.com', NULL, NULL),
(20, 'Nguyễn Tấn Lượng', 'Gia Lai', '0989688673', 'nguyenvanluong101@gmail.com', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Chỉ mục cho bảng `tbl_brand`
--
ALTER TABLE `tbl_brand`
  ADD PRIMARY KEY (`brand_id`);

--
-- Chỉ mục cho bảng `tbl_category_product`
--
ALTER TABLE `tbl_category_product`
  ADD PRIMARY KEY (`category_id`);

--
-- Chỉ mục cho bảng `tbl_comment`
--
ALTER TABLE `tbl_comment`
  ADD PRIMARY KEY (`comment_id`);

--
-- Chỉ mục cho bảng `tbl_customers`
--
ALTER TABLE `tbl_customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Chỉ mục cho bảng `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Chỉ mục cho bảng `tbl_order_details`
--
ALTER TABLE `tbl_order_details`
  ADD PRIMARY KEY (`order_details_id`);

--
-- Chỉ mục cho bảng `tbl_payment`
--
ALTER TABLE `tbl_payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- Chỉ mục cho bảng `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`product_id`);

--
-- Chỉ mục cho bảng `tbl_shipping`
--
ALTER TABLE `tbl_shipping`
  ADD PRIMARY KEY (`shipping_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT cho bảng `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `admin_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `tbl_brand`
--
ALTER TABLE `tbl_brand`
  MODIFY `brand_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `tbl_category_product`
--
ALTER TABLE `tbl_category_product`
  MODIFY `category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `tbl_comment`
--
ALTER TABLE `tbl_comment`
  MODIFY `comment_id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `tbl_customers`
--
ALTER TABLE `tbl_customers`
  MODIFY `customer_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `order_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `tbl_order_details`
--
ALTER TABLE `tbl_order_details`
  MODIFY `order_details_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `tbl_payment`
--
ALTER TABLE `tbl_payment`
  MODIFY `payment_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `product_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `tbl_shipping`
--
ALTER TABLE `tbl_shipping`
  MODIFY `shipping_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
