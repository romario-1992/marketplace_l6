-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 26-Jun-2020 às 21:29
-- Versão do servidor: 10.4.11-MariaDB
-- versão do PHP: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `marketplace_l6`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Roupas', 'Roupas em geral', 'roupas', '2020-06-25 22:50:40', '2020-06-25 22:50:40'),
(2, 'Carro', 'Carro em geral', 'carro', '2020-06-25 22:50:50', '2020-06-25 22:50:50');

-- --------------------------------------------------------

--
-- Estrutura da tabela `category_product`
--

CREATE TABLE `category_product` (
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_06_12_183139_create_table_store', 1),
(12, '2020_06_12_190504_create_products_table', 2),
(13, '2020_06_15_171055_create_categories_table', 2),
(14, '2020_06_15_173457_create_category_product_table', 2),
(15, '2020_06_19_212443_create_product_photos_table', 2),
(16, '2020_06_19_213503_alter_table_stores_add_column_logo', 2),
(17, '2020_06_25_192528_create_user_order_table', 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `products`
--

INSERT INTO `products` (`id`, `store_id`, `name`, `description`, `body`, `price`, `slug`, `created_at`, `updated_at`) VALUES
(1, 1, 'Camisa New jersey Nets', 'Camisa de Basquete em ótimo estado', 'Camisa em ótimo estado', '100.00', 'camisa-new-jersey-nets', '2020-06-25 22:51:56', '2020-06-25 22:52:05'),
(2, 1, 'Camisa Corinthinas', 'Camisa todo poderoso timão para os apaixonados', 'Ótimo produto', '120.00', 'camisa-corinthinas', '2020-06-25 22:53:10', '2020-06-25 22:53:10'),
(3, 2, 'Camisa Jersey', 'Camisa de Basquete em ótimo estado', 'Camisa', '150.00', 'camisa-jersey', '2020-06-26 00:15:34', '2020-06-26 00:16:36');

-- --------------------------------------------------------

--
-- Estrutura da tabela `product_photos`
--

CREATE TABLE `product_photos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `product_photos`
--

INSERT INTO `product_photos` (`id`, `product_id`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, 'products/DqrL4VDgmWGAN1c6OL7bPmR8qbrPIuvhDYJEQ4OI.jpeg', '2020-06-25 22:52:27', '2020-06-25 22:52:27'),
(2, 2, 'products/B8m1Iq20Sh9N1tk7wJUkFpQbTIYiF8a4eSJMGtDo.jpeg', '2020-06-25 22:53:10', '2020-06-25 22:53:10'),
(3, 3, 'products/jguookQsKRysli4bxiRY65pRaus7IOPxFfcLSvvn.jpeg', '2020-06-26 00:15:35', '2020-06-26 00:15:35');

-- --------------------------------------------------------

--
-- Estrutura da tabela `stores`
--

CREATE TABLE `stores` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `stores`
--

INSERT INTO `stores` (`id`, `user_id`, `name`, `description`, `phone`, `mobile_phone`, `slug`, `created_at`, `updated_at`, `logo`) VALUES
(1, 1, 'Loja editada com mensagem', 'Loja editada com mensagem', '(643) 570-4256 x83543', '+14193774617', 'consequuntur-repellendus-fugiat-dicta-repudiandae-optio-deleniti-ab', '2020-06-15 21:27:57', '2020-06-20 23:08:26', NULL),
(2, 2, 'Laurel Stehr', 'Aut non aut mollitia adipisci.', '1-780-765-6445', '276.945.6661', 'dolores-repellendus-quos-aspernatur-voluptatem-architecto-dolores-vero', '2020-06-15 21:27:57', '2020-06-15 21:27:57', NULL),
(3, 3, 'Lucie Johnson', 'Voluptates unde voluptate dolorum cum sit beatae excepturi non.', '1-350-775-3337', '921-904-8240 x376', 'fuga-voluptatem-a-praesentium-porro-similique-magni-sit', '2020-06-15 21:27:57', '2020-06-15 21:27:57', NULL),
(4, 4, 'Mikayla Mohr', 'Voluptas quasi quia accusamus magni sed.', '801-592-0724', '1-216-316-2551 x9118', 'vitae-voluptas-saepe-maxime-et-nisi-voluptas-placeat', '2020-06-15 21:27:57', '2020-06-15 21:27:57', NULL),
(5, 5, 'Ezekiel Brekke', 'Sapiente voluptatem commodi natus.', '+1 (401) 955-2339', '1-321-785-9146 x850', 'labore-eum-quisquam-autem-qui-dolores-in-iure-est', '2020-06-15 21:27:57', '2020-06-15 21:27:57', NULL),
(6, 6, 'Mr. Kamron Schimmel Sr.', 'Animi assumenda inventore ad iste quia.', '(997) 523-7913', '503-777-5306 x422', 'assumenda-illo-voluptatem-rerum-quasi-voluptatem-necessitatibus-quia', '2020-06-15 21:27:57', '2020-06-15 21:27:57', NULL),
(7, 7, 'Prof. Jany Quigley', 'Quod ea facere voluptatem magnam.', '(646) 770-6170 x763', '621.985.9180 x599', 'et-tenetur-rem-commodi-sunt-pariatur-earum-facilis', '2020-06-15 21:27:57', '2020-06-15 21:27:57', NULL),
(8, 8, 'Dr. Dee Wiza I', 'Recusandae eos sapiente quia.', '+1-516-998-2691', '(315) 571-4053 x8461', 'reprehenderit-molestiae-vero-quidem-rerum-illum-possimus-aperiam', '2020-06-15 21:27:57', '2020-06-15 21:27:57', NULL),
(9, 9, 'Miss Ariane Williamson DDS', 'Incidunt reiciendis aut repudiandae nisi magnam corporis distinctio.', '953.618.4820 x138', '530-477-4176', 'tempora-est-ut-et-est-laboriosam-beatae', '2020-06-15 21:27:57', '2020-06-15 21:27:57', NULL),
(10, 10, 'Hailee Sawayn', 'Incidunt sunt aut rerum nihil exercitationem sequi sint.', '+1.828.754.4504', '+19022812966', 'mollitia-est-deleniti-voluptas-eos-doloribus-dolorem-asperiores', '2020-06-15 21:27:57', '2020-06-15 21:27:57', NULL),
(11, 11, 'Rosemarie Wehner', 'Officiis voluptatem sapiente ut fuga voluptatibus est.', '946-668-7654', '(865) 925-9203 x25447', 'quos-reprehenderit-temporibus-id-dignissimos', '2020-06-15 21:27:57', '2020-06-15 21:27:57', NULL),
(12, 12, 'Mr. Kayden Fritsch', 'Rem nam distinctio ex sunt.', '824-307-2608 x737', '(583) 545-6692 x0052', 'quod-eveniet-deserunt-eum-sunt-asperiores-nulla-sunt', '2020-06-15 21:27:57', '2020-06-15 21:27:57', NULL),
(13, 13, 'Dr. Godfrey Kovacek', 'Quos et eos labore non nihil necessitatibus atque.', '1-807-336-9637 x65645', '778-554-0209', 'dolor-sed-est-id-exercitationem-rerum-omnis-facere', '2020-06-15 21:27:58', '2020-06-15 21:27:58', NULL),
(14, 14, 'Mr. Elliot Eichmann', 'A neque nihil ipsum esse architecto quae.', '1-825-954-3115 x576', '+12153886571', 'molestias-mollitia-vero-officia-nihil', '2020-06-15 21:27:58', '2020-06-15 21:27:58', NULL),
(15, 15, 'Dr. Americo Marks', 'Nisi et cumque libero aut a nemo voluptates.', '467-208-8996', '(832) 674-6200 x350', 'voluptas-esse-quod-hic-tempora-odit-perspiciatis', '2020-06-15 21:27:58', '2020-06-15 21:27:58', NULL),
(16, 16, 'Jamison Nolan', 'Possimus eaque est asperiores in doloribus totam.', '+1.985.696.4512', '1-690-455-9115 x10047', 'consequatur-neque-cum-possimus-blanditiis-non', '2020-06-15 21:27:58', '2020-06-15 21:27:58', NULL),
(17, 17, 'Alana Goodwin', 'Nobis optio nihil nostrum dolore neque a tenetur repellendus.', '(431) 295-6061', '1-734-533-9592', 'est-nihil-architecto-possimus-et-ex-tempora', '2020-06-15 21:27:58', '2020-06-15 21:27:58', NULL),
(18, 18, 'Kendrick Abbott', 'Officiis dolorum eaque nemo explicabo qui assumenda velit.', '(798) 757-9417 x54988', '+1-885-870-4744', 'nam-facere-consequatur-eos-sunt-aut-ipsa', '2020-06-15 21:27:58', '2020-06-15 21:27:58', NULL),
(19, 19, 'Liliana D\'Amore', 'Voluptate cumque architecto aut quod tenetur harum aut omnis.', '+1.354.800.0076', '1-790-472-9000 x23694', 'facere-adipisci-ipsum-placeat-eum-qui-labore', '2020-06-15 21:27:58', '2020-06-15 21:27:58', NULL),
(20, 20, 'Mrs. Estefania Runte', 'Architecto ut rerum et et omnis qui sint quaerat.', '+1-508-312-0993', '(675) 924-1671', 'ipsam-voluptatem-aliquam-et-velit-accusamus-ut-doloremque-sed', '2020-06-15 21:27:58', '2020-06-15 21:27:58', NULL),
(21, 21, 'Sienna Murphy', 'Non dolor quidem mollitia.', '+1-717-944-3229', '+1.348.926.4772', 'aut-autem-quia-dolor-atque-dolores-voluptatem', '2020-06-15 21:27:58', '2020-06-15 21:27:58', NULL),
(22, 22, 'Mr. Sherwood Connelly Jr.', 'Est ad aliquam perspiciatis doloremque voluptatibus.', '+19574886677', '+18026173913', 'non-commodi-corporis-et-blanditiis-aut-id-aspernatur', '2020-06-15 21:27:58', '2020-06-15 21:27:58', NULL),
(23, 23, 'Dr. Beth Gibson', 'Libero accusamus soluta fugit veniam rerum.', '+1 (976) 552-4698', '223-555-7000 x1649', 'aut-odit-omnis-aut-non-accusantium-et', '2020-06-15 21:27:58', '2020-06-15 21:27:58', NULL),
(24, 24, 'Briana Nicolas', 'Sunt consequatur velit maiores minima sit.', '+16904484349', '938-793-4525', 'aut-dolores-magni-quia-fugit-maxime-voluptatibus-sequi', '2020-06-15 21:27:58', '2020-06-15 21:27:58', NULL),
(25, 25, 'Prof. Joelle Kub', 'Et officia ad voluptatum unde impedit molestiae dolor.', '(210) 617-5804 x255', '902-822-0600', 'eos-labore-eum-asperiores-magnam', '2020-06-15 21:27:58', '2020-06-15 21:27:58', NULL),
(26, 26, 'Luz Goldner', 'Deserunt architecto accusamus magni voluptatum.', '758.457.2194 x28281', '548.889.9338 x541', 'sed-velit-impedit-molestias-voluptatibus-voluptatem-sint-quas', '2020-06-15 21:27:58', '2020-06-15 21:27:58', NULL),
(27, 27, 'Mr. Juvenal Huels PhD', 'Aliquid voluptates eos ad dolores.', '729-279-1097 x7822', '1-457-595-9933 x04218', 'aut-culpa-delectus-quidem-et-vitae', '2020-06-15 21:27:58', '2020-06-15 21:27:58', NULL),
(28, 28, 'Ms. Ona Klocko MD', 'Id neque impedit et impedit vel pariatur cupiditate consequatur.', '1-651-875-9845', '562.275.7568', 'itaque-ipsam-praesentium-non-iste-debitis-modi-est-corporis', '2020-06-15 21:27:58', '2020-06-15 21:27:58', NULL),
(29, 29, 'Ms. Alexane Lemke', 'Ut ullam eveniet quos qui aliquam.', '615-976-0872 x988', '1-863-706-2698 x82716', 'occaecati-totam-neque-voluptas-ullam-et-velit-sequi', '2020-06-15 21:27:58', '2020-06-15 21:27:58', NULL),
(30, 30, 'Josefa Kutch', 'Dolorum est et ipsum quia consectetur quidem mollitia.', '748-906-6531 x81323', '408-635-8067 x879', 'natus-impedit-odit-saepe-ex', '2020-06-15 21:27:58', '2020-06-15 21:27:58', NULL),
(31, 31, 'Anastasia Streich III', 'Dolorum perspiciatis sit rerum voluptas fugiat consequuntur.', '989.970.5435', '1-791-975-1526', 'et-ratione-esse-sit-vel-quos', '2020-06-15 21:27:58', '2020-06-15 21:27:58', NULL),
(32, 32, 'Brionna Goldner', 'Quam dolorum voluptatem aliquid officiis dolorem impedit.', '1-298-387-8075 x38308', '+1-804-867-6418', 'quia-omnis-aut-necessitatibus-ducimus', '2020-06-15 21:27:58', '2020-06-15 21:27:58', NULL),
(33, 33, 'America Jenkins', 'Eos aut ea pariatur.', '796.534.3305 x924', '+18975975619', 'laborum-ut-in-quidem-quia-ut-ea-et-et', '2020-06-15 21:27:58', '2020-06-15 21:27:58', NULL),
(34, 34, 'Valerie Moore', 'Officiis quis minima aut nostrum.', '+1-470-852-9715', '(916) 837-7310 x461', 'placeat-quisquam-reprehenderit-corrupti-ratione', '2020-06-15 21:27:58', '2020-06-15 21:27:58', NULL),
(35, 35, 'Mia Jacobson MD', 'Doloremque cumque quisquam nam laborum cumque provident nam.', '225.492.5386', '918.352.3893 x57673', 'autem-quis-nesciunt-amet-reprehenderit-velit-neque-illo', '2020-06-15 21:27:58', '2020-06-15 21:27:58', NULL),
(36, 36, 'Marcellus Krajcik', 'Et vel enim aliquid.', '518-707-0807 x441', '+18147309678', 'delectus-odit-temporibus-soluta-blanditiis', '2020-06-15 21:27:58', '2020-06-15 21:27:58', NULL),
(37, 37, 'Ivy Douglas Sr.', 'Et temporibus laudantium natus fuga autem.', '215.809.5122 x62482', '1-456-998-1628', 'cumque-qui-tempore-quo-hic', '2020-06-15 21:27:58', '2020-06-15 21:27:58', NULL),
(38, 38, 'Jamel Walker', 'Nihil asperiores sit rerum aspernatur ipsa reiciendis rem sed.', '298-801-5126 x931', '(967) 888-8893', 'modi-illum-temporibus-autem-sit-autem-et-modi', '2020-06-15 21:27:58', '2020-06-15 21:27:58', NULL),
(39, 39, 'Jennifer Nitzsche', 'Reiciendis repudiandae omnis voluptates tempore.', '(820) 617-0944 x310', '606-201-7502', 'officiis-omnis-a-cum-id-reiciendis-eveniet', '2020-06-15 21:27:58', '2020-06-15 21:27:58', NULL),
(40, 40, 'Geoffrey Welch', 'Cumque voluptates asperiores deserunt numquam sed aut beatae.', '340-233-2096 x3104', '+1 (393) 486-4787', 'quia-qui-quia-at-deserunt-et-necessitatibus-expedita', '2020-06-15 21:27:58', '2020-06-15 21:27:58', NULL),
(41, 10, 'Loja teste', 'Loja teste de produtos de informática', 'xx-xxxxx-xxxx', 'xx-xxxxx-xxxx', 'loja-teste', '2020-06-15 23:51:27', '2020-06-15 23:51:27', NULL),
(45, 1, 'loja-logo-teste', 'teste-log-da-loja-para-teste', '11985440949', '11985440949', 'loja-logo-teste', '2020-06-20 22:03:07', '2020-06-20 22:03:07', NULL),
(46, 41, 'Loja Romario teste', 'Loja Romário teste', '11985440949', '11985440949', 'loja-romario', '2020-06-21 01:43:43', '2020-06-21 01:43:43', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
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
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Miss Maya Bernier DVM', 'ferne16@example.com', '2020-06-15 21:27:55', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'FyDpJ4KSGkAZTtaEn3W0LUyyAjEIKwzwM7froTQ77S2kJf669uIcFrt75gHE', '2020-06-15 21:27:55', '2020-06-15 21:27:55'),
(2, 'Junius Medhurst', 'ssmith@example.net', '2020-06-15 21:27:55', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '1lDpE3UbJP', '2020-06-15 21:27:55', '2020-06-15 21:27:55'),
(3, 'Mrs. Leatha Kiehn Sr.', 'mhirthe@example.com', '2020-06-15 21:27:55', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '9gBQhTJIF7', '2020-06-15 21:27:55', '2020-06-15 21:27:55'),
(4, 'Dr. Timmy Swaniawski', 'frederik78@example.org', '2020-06-15 21:27:55', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'LQg6vX31QJ', '2020-06-15 21:27:55', '2020-06-15 21:27:55'),
(5, 'Prof. Doyle Larkin', 'dion54@example.org', '2020-06-15 21:27:55', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'xWUZtIjUJW', '2020-06-15 21:27:55', '2020-06-15 21:27:55'),
(6, 'Cristal Davis I', 'burley.renner@example.org', '2020-06-15 21:27:55', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'CUxeHxi5Zv', '2020-06-15 21:27:55', '2020-06-15 21:27:55'),
(7, 'Sammie Thiel', 'feest.jerel@example.org', '2020-06-15 21:27:55', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ILdKGaniVP', '2020-06-15 21:27:55', '2020-06-15 21:27:55'),
(8, 'Luna Becker', 'ariane60@example.com', '2020-06-15 21:27:55', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '5auKODuooZ', '2020-06-15 21:27:55', '2020-06-15 21:27:55'),
(9, 'Shaylee VonRueden', 'jenkins.bridie@example.org', '2020-06-15 21:27:55', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'O7OjsXsbXR', '2020-06-15 21:27:55', '2020-06-15 21:27:55'),
(10, 'Christop Schuster', 'osvaldo.spinka@example.net', '2020-06-15 21:27:55', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'd1bMMmEXjY', '2020-06-15 21:27:55', '2020-06-15 21:27:55'),
(11, 'Emerald Mraz', 'kianna.heller@example.org', '2020-06-15 21:27:55', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'v3CM1RfIhz', '2020-06-15 21:27:55', '2020-06-15 21:27:55'),
(12, 'Theron Hintz', 'lgaylord@example.net', '2020-06-15 21:27:55', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'jLXZku7jZm', '2020-06-15 21:27:55', '2020-06-15 21:27:55'),
(13, 'Miss Daniella Grady DDS', 'kylee.hintz@example.net', '2020-06-15 21:27:55', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2B1bqRzICw', '2020-06-15 21:27:55', '2020-06-15 21:27:55'),
(14, 'Destiney Borer V', 'yswaniawski@example.com', '2020-06-15 21:27:55', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'CG33cqzNNZ', '2020-06-15 21:27:56', '2020-06-15 21:27:56'),
(15, 'Bella Schumm', 'emile.sporer@example.com', '2020-06-15 21:27:55', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'dDEGNIJVv9', '2020-06-15 21:27:56', '2020-06-15 21:27:56'),
(16, 'Margot Daugherty', 'peggie.carroll@example.com', '2020-06-15 21:27:55', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'aOO7d5Hah3', '2020-06-15 21:27:56', '2020-06-15 21:27:56'),
(17, 'Candice Stamm III', 'shanny.batz@example.com', '2020-06-15 21:27:55', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '926gYQFcyY', '2020-06-15 21:27:56', '2020-06-15 21:27:56'),
(18, 'Ms. Alize Hackett DVM', 'johns.manley@example.org', '2020-06-15 21:27:55', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'emlepkmHhT', '2020-06-15 21:27:56', '2020-06-15 21:27:56'),
(19, 'Prof. Felipa Funk V', 'nels.lockman@example.org', '2020-06-15 21:27:55', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'TRuqBkv6bn', '2020-06-15 21:27:56', '2020-06-15 21:27:56'),
(20, 'Stephania Upton', 'terence61@example.com', '2020-06-15 21:27:55', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'aRgN8E4QMw', '2020-06-15 21:27:56', '2020-06-15 21:27:56'),
(21, 'Virgie Runte', 'janelle.thompson@example.com', '2020-06-15 21:27:55', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'YO7Fj44wQH', '2020-06-15 21:27:56', '2020-06-15 21:27:56'),
(22, 'Adaline Rice', 'yesenia.kris@example.com', '2020-06-15 21:27:55', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'eqZ69LrIFz', '2020-06-15 21:27:56', '2020-06-15 21:27:56'),
(23, 'Miss Felicity Cronin', 'hartmann.sherman@example.net', '2020-06-15 21:27:55', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'oipoa8EoKb', '2020-06-15 21:27:56', '2020-06-15 21:27:56'),
(24, 'Marquis Hamill', 'karlee79@example.net', '2020-06-15 21:27:55', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'yEyeiVsr5n', '2020-06-15 21:27:56', '2020-06-15 21:27:56'),
(25, 'Prof. Nadia Rutherford Jr.', 'serena.oconner@example.com', '2020-06-15 21:27:55', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'D0Vs6svkQ3', '2020-06-15 21:27:56', '2020-06-15 21:27:56'),
(26, 'Prof. Raymond Koss II', 'dweimann@example.com', '2020-06-15 21:27:55', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 's6qLy2i0GZ', '2020-06-15 21:27:56', '2020-06-15 21:27:56'),
(27, 'Claudie Schuppe Jr.', 'ezekiel.bauch@example.net', '2020-06-15 21:27:55', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'YD8dyVOZSS', '2020-06-15 21:27:56', '2020-06-15 21:27:56'),
(28, 'Narciso Hickle', 'caitlyn81@example.org', '2020-06-15 21:27:55', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'NCEEWigu3s', '2020-06-15 21:27:56', '2020-06-15 21:27:56'),
(29, 'Edmund Kessler', 'dock08@example.com', '2020-06-15 21:27:55', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'kPWVgujXFd', '2020-06-15 21:27:56', '2020-06-15 21:27:56'),
(30, 'Laurence Gerhold', 'opal56@example.com', '2020-06-15 21:27:55', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'H9urD04AJn', '2020-06-15 21:27:56', '2020-06-15 21:27:56'),
(31, 'Brittany West', 'reggie96@example.net', '2020-06-15 21:27:55', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'nZt1i1rECu', '2020-06-15 21:27:56', '2020-06-15 21:27:56'),
(32, 'Ulices Schumm', 'ola.jaskolski@example.net', '2020-06-15 21:27:55', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'tL3BeT9S9y', '2020-06-15 21:27:56', '2020-06-15 21:27:56'),
(33, 'Mark Von', 'kennith27@example.net', '2020-06-15 21:27:55', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'DP8GiT73wI', '2020-06-15 21:27:56', '2020-06-15 21:27:56'),
(34, 'Lauriane Rodriguez DDS', 'legros.erica@example.net', '2020-06-15 21:27:55', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'avodGKTzS6', '2020-06-15 21:27:56', '2020-06-15 21:27:56'),
(35, 'Sierra Mayer', 'ankunding.deon@example.net', '2020-06-15 21:27:55', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'UXBt9gB2rZ', '2020-06-15 21:27:56', '2020-06-15 21:27:56'),
(36, 'Jerome Weber DDS', 'kbradtke@example.org', '2020-06-15 21:27:55', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'aMMjAf0iWV', '2020-06-15 21:27:56', '2020-06-15 21:27:56'),
(37, 'Helena Cremin DDS', 'flatley.cleveland@example.net', '2020-06-15 21:27:55', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'EZ5i2mKWA6', '2020-06-15 21:27:56', '2020-06-15 21:27:56'),
(38, 'Ottis Zemlak', 'leuschke.glenna@example.org', '2020-06-15 21:27:55', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'HAirMB5Nij', '2020-06-15 21:27:56', '2020-06-15 21:27:56'),
(39, 'Carlo Roberts PhD', 'destiny41@example.org', '2020-06-15 21:27:55', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'HgS5Mprmb3', '2020-06-15 21:27:56', '2020-06-15 21:27:56'),
(40, 'Miss Hailie Wiza IV', 'ihyatt@example.com', '2020-06-15 21:27:55', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'CyRA1mI3rT', '2020-06-15 21:27:56', '2020-06-15 21:27:56'),
(41, 'Romario Cavalcante', 'romariolinkin@hotmail.com', NULL, '$2y$10$fEHzROF.62oSRmfRuUqCRuQHUFa8Y2Wo96Sq/8LZmYRXMlpYrNtOO', NULL, '2020-06-21 01:26:36', '2020-06-21 01:26:36');

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_orders`
--

CREATE TABLE `user_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pagseguro_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pagseguro_status` int(11) NOT NULL,
  `items` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `category_product`
--
ALTER TABLE `category_product`
  ADD KEY `category_product_product_id_foreign` (`product_id`),
  ADD KEY `category_product_category_id_foreign` (`category_id`);

--
-- Índices para tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Índices para tabela `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_store_id_foreign` (`store_id`);

--
-- Índices para tabela `product_photos`
--
ALTER TABLE `product_photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_photos_product_id_foreign` (`product_id`);

--
-- Índices para tabela `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stores_user_id_foreign` (`user_id`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Índices para tabela `user_orders`
--
ALTER TABLE `user_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_orders_user_id_foreign` (`user_id`),
  ADD KEY `user_orders_store_id_foreign` (`store_id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de tabela `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `product_photos`
--
ALTER TABLE `product_photos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `stores`
--
ALTER TABLE `stores`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT de tabela `user_orders`
--
ALTER TABLE `user_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `category_product`
--
ALTER TABLE `category_product`
  ADD CONSTRAINT `category_product_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `category_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Limitadores para a tabela `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_store_id_foreign` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`);

--
-- Limitadores para a tabela `product_photos`
--
ALTER TABLE `product_photos`
  ADD CONSTRAINT `product_photos_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Limitadores para a tabela `stores`
--
ALTER TABLE `stores`
  ADD CONSTRAINT `stores_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Limitadores para a tabela `user_orders`
--
ALTER TABLE `user_orders`
  ADD CONSTRAINT `user_orders_store_id_foreign` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`),
  ADD CONSTRAINT `user_orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
