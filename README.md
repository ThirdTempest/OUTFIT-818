# OUTFIT-818 🛍️

A fully functional e-commerce clothing website built with Laravel PHP Framework, featuring modern design and comprehensive shopping functionalities.

## ✨ Features

- **Payment Gateway Integration** - Secure payments powered by Cashfree
- **Shopping Cart** - Add to cart functionality with seamless checkout
- **CSV Import** - Bulk product import via CSV files
- **Stock Management** - Real-time inventory tracking and management
- **Bill Generation** - Automated invoice generation for orders
- **Advanced Filtering & Sorting** - Easy product discovery
- **Email Notifications** - Automated order confirmations and updates
- **Outfit of the Day** - Curated daily fashion recommendations
- **Admin Dashboard** - Complete control panel for store management

## 🚀 Tech Stack

- **Backend:** Laravel (PHP Framework)
- **Frontend Styling:** Tailwind CSS (CDN)
- **Animations:** AOS (Animate On Scroll)
- **Icons:** Font Awesome 6.4.0
- **Payment Gateway:** Cashfree

## 📋 Prerequisites

- PHP >= 8.0
- Composer
- MySQL
- Web Server (Apache/Nginx)

## 🔧 Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/Nisarg-Vekariya/OUTFIT-818.git
   cd OUTFIT-818
   ```

2. **Install dependencies**
   ```bash
   composer install
   ```

3. **Environment Configuration**
   ```bash
   cp .env.example .env
   php artisan key:generate
   ```

4. **Configure .env file**
   
   Update the following variables in your `.env` file:
   
   ```env
   # Database Configuration
   DB_CONNECTION=mysql
   DB_HOST=127.0.0.1
   DB_PORT=3306
   DB_DATABASE=outfit_818
   DB_USERNAME=your_username
   DB_PASSWORD=your_password
   
   # Mail Configuration
   MAIL_MAILER=smtp
   MAIL_HOST=smtp.gmail.com
   MAIL_PORT=587
   MAIL_USERNAME=your_email@gmail.com
   MAIL_PASSWORD=your_app_password
   MAIL_ENCRYPTION=tls
   MAIL_FROM_ADDRESS=your_email@gmail.com
   
   # Cashfree Payment Gateway
   CASHFREE_APP_ID=your_cashfree_app_id
   CASHFREE_SECRET_KEY=your_cashfree_secret_key
   ```

5. **Import Database**
   
   Import the provided SQL file:
   ```bash
   mysql -u your_username -p outfit_818 < outfit_818.sql
   ```
   
   Or use phpMyAdmin/MySQL Workbench to import `outfit_818.sql`

6. **Run the application**
   ```bash
   php artisan serve
   ```
   
   Visit: `http://localhost:8000`

## 👤 Admin Access

- **Email:** team.818x@gmail.com
- **Password:** Team@818

## 📧 Email Setup Guide

To enable email notifications:

1. Enable 2-Factor Authentication in your Gmail account
2. Generate an App Password:
   - Go to Google Account Settings
   - Security → 2-Step Verification → App Passwords
   - Generate password for "Mail"
3. Use the generated 16-character password in your `.env` file

## 💳 Payment Gateway Setup

1. Create a Cashfree account at [cashfree.com](https://www.cashfree.com)
2. Get your App ID and Secret Key from the dashboard
3. Add credentials to `.env` file

## 📁 Project Structure

```
OUTFIT-818/
├── app/              # Application logic
├── public/           # Public assets
├── resources/        # Views, CSS, JS
├── routes/           # Route definitions
├── database/         # Migrations & seeders
├── outfit_818.sql    # Database file
└── .env.example      # Environment template
```

## 🎨 Frontend Libraries (CDN)

- **Tailwind CSS:** `https://cdn.tailwindcss.com`
- **AOS:** `https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css`
- **Font Awesome:** `https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css`

## ⚠️ Disclaimer

This project uses images without specific copyright licensing. Please replace all images with properly licensed alternatives before commercial use.

## 🤝 Contributing

Contributions, issues, and feature requests are welcome! Feel free to check the issues page.

## 👨‍💻 Team 818

Developed with ❤️ by Team 818

### Contact
- **Email**: team.818x@gmail.com
- **GitHub**: [Nisarg-Vekariya](https://github.com/Nisarg-Vekariya)

## 📞 Support

For any queries or support, please contact: team.818x@gmail.com

---

⭐ Star this repository if you find it helpful!
