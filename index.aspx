<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="SchoolManagementSystem.index" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Codevocadoa School Management - Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background-color: #f6fbff;
        }

        .hero-section {
            min-height: 100vh;
            display: flex;
            align-items: center;
            padding: 50px;
        }

        .hero-text h1 {
            font-size: 40px;
            font-weight: 700;
            color: #1a1a1a;
        }

        .hero-text p {
            font-size: 18px;
            color: #555;
            margin-top: 15px;
            max-width: 600px;
        }

        .hero-image img {
            max-width: 100%;
        }
        .hero-section {
    background-image: url('bg.png'); /* use correct path */
    background-size: cover;        /* This makes image fill the section */
    background-position: center;   /* Center the image */
    background-repeat: no-repeat;  /* Don't repeat */
    height: 100vh;                 /* Make section full screen height */
    display: flex;
    justify-content: center;
    align-items: center;
    text-align: center;
    color: white;                 /* Optional: ensures text is visible */
    padding: 20px;
}


        .btn-primary-custom {
            background-color: #4cb5f5;
            border: none;
            font-weight: 600;
        }

        .btn-primary-custom:hover {
            background-color: #38a0d9;
        }

        .navbar-light .navbar-brand {
            font-weight: 700;
            font-size: 24px;
        }

        .dark-mode-toggle {
            background: none;
            border: none;
            font-size: 20px;
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-light px-4 py-3 bg-white shadow-sm">
        <a class="navbar-brand" href="#">
            <img src="code.png" alt="logo" width="30" class="me-2" />
            SCHOOL MANAGEMENT
        </a>
        <div>
            <a href="index.aspx" class="me-3">Home</a>
            <a href="#" class="me-3">About Us</a>
            <button class="dark-mode-toggle me-3" onclick="toggleDarkMode()">🌙</button>
            <a href="Login.aspx" class="btn btn-primary btn-sm">Login</a>
        </div>
    </nav>

    <!-- Hero Section -->
    <div class="container hero-section">
        <div class="row align-items-center">
            <div class="col-md-6 hero-text">
                <h1>Empower Education With <br /> Codevocado School Management</h1>
                <p>A comprehensive solution to streamline school operations, track student data, manage resources, and enhance communication seamlessly.</p>
                <a href="Login.aspx" class="btn btn-primary-custom btn-lg mt-4">Get Started</a>
            </div>
           
        </div>
    </div>

    <script>
        function toggleDarkMode() {
            document.body.classList.toggle("bg-dark");
            document.body.classList.toggle("text-white");
        }
    </script>
</body>
</html>
