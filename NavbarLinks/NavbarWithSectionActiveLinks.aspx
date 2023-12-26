<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NavbarWithSectionActiveLinks.aspx.cs" Inherits="DesignsAndEffects.NavbarLinks.NavbarWithSectionActiveLinks" %>





<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Dynamic Links with Bootstrap</title>
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <style>
    body {
      padding-top: 56px; /* Adjusted for the fixed navbar */
    }

    section {
      padding: 20px;
    }

    .active {
      background-color: #007bff;
      color: #fff;
    }

    .team-card {
      cursor: pointer;
    }

    .team-modal img {
      max-width: 100%;
    }

    .background-overlay {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background-color: rgba(0, 0, 0, 0.7);
      display: none;
    }

    .team-modal-content {
      position: fixed;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      background-color: #fff;
      padding: 20px;
      border-radius: 5px;
      display: none;
    }

    .close-btn {
      position: absolute;
      top: 10px;
      right: 10px;
      cursor: pointer;
    }
  </style>
</head>
<body>

  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <a class="navbar-brand" href="#">Dynamic Links</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="#home">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#about">About</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#contact">Contact</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#team">Team</a>
        </li>
      </ul>
    </div>
  </nav>

  <section id="home" class="container mt-5">
    <h2>Welcome to the Home Page</h2>
    <p>This is the default content that will change based on the selected link.</p>
  </section>

  <section id="about" class="container mt-5">
    <h2>About Us</h2>
    <p>We are a dynamic company with a mission to...</p>
  </section>

  <section id="contact" class="container mt-5">
    <h2>Contact Us</h2>
    <p>Feel free to reach out to us using the contact form below:</p>
    <form>
      <label for="email">Email:</label>
      <input type="email" id="email" name="email"><br>
      <label for="message">Message:</label>
      <textarea id="message" name="message"></textarea><br>
      <input type="submit" value="Submit">
    </form>
  </section>

  <section id="team" class="container mt-5">
    <h2>Our Team</h2>
    <div class="row">
      <div class="col-md-4 team-card" data-target="#teamMember1Modal">
        <img src="https://via.placeholder.com/150" alt="Team Member 1">
        <p class="mt-2">John Doe</p>
        <p>CEO</p>
      </div>
      <div class="col-md-4 team-card" data-target="#teamMember2Modal">
        <img src="https://via.placeholder.com/150" alt="Team Member 2">
        <p class="mt-2">Jane Smith</p>
        <p>CTO</p>
      </div>
      <div class="col-md-4 team-card" data-target="#teamMember3Modal">
        <img src="https://via.placeholder.com/150" alt="Team Member 3">
        <p class="mt-2">Bob Johnson</p>
        <p>Lead Developer</p>
      </div>
    </div>
  </section>

  <!-- Team Member Modals -->
  <div id="teamMember1Modal" class="background-overlay">
    <div class="team-modal-content">
      <span class="close-btn" onclick="closeModal('#teamMember1Modal')">&times;</span>
      <img src="https://via.placeholder.com/300" alt="Team Member 1">
      <h5>John Doe</h5>
      <p>CEO</p>
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla convallis libero a eros consectetur, a cursus nulla eleifend.</p>
    </div>
  </div>

  <div id="teamMember2Modal" class="background-overlay">
    <div class="team-modal-content">
      <span class="close-btn" onclick="closeModal('#teamMember2Modal')">&times;</span>
      <img src="https://via.placeholder.com/300" alt="Team Member 2">
      <h5>Jane Smith</h5>
      <p>CTO</p>
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla convallis libero a eros consectetur, a cursus nulla eleifend.</p>
    </div>
  </div>

  <div id="teamMember3Modal" class="background-overlay">
    <div class="team-modal-content">
      <span class="close-btn" onclick="closeModal('#teamMember3Modal')">&times;</span>
      <img src="https://via.placeholder.com/300" alt="Team Member 3">
      <h5>Bob Johnson</h5>
      <p>Lead Developer</p>
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla convallis libero a eros consectetur, a cursus nulla eleifend.</p>
    </div>
  </div>

  <!-- Bootstrap JS and dependencies -->
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

  <script>
      document.addEventListener('DOMContentLoaded', function () {
          window.onscroll = function () {
              const scrollPos = document.documentElement.scrollTop || document.body.scrollTop;
              const sections = document.querySelectorAll('section');

              sections.forEach(section => {
                  const sectionTop = section.offsetTop - 70; // Adjusted for the fixed navbar
                  const sectionBottom = sectionTop + section.offsetHeight;

                  const navLinks = document.querySelectorAll('.nav-link');
                  const currentLinkId = section.id.toLowerCase();

                  if (scrollPos >= sectionTop && scrollPos < sectionBottom) {
                      navLinks.forEach(link => {
                          link.classList.remove('active');
                      });

                      document.querySelector(`.nav-link[href="#${currentLinkId}"]`).classList.add('active');
                  }
              });
          };

          document.querySelectorAll('.team-card').forEach(card => {
              card.addEventListener('click', function () {
                  const modalId = this.getAttribute('data-target');
                  openModal(modalId);
              });
          });
      });

      function openModal(modalId) {
          document.querySelector(modalId).style.display = 'block';
          document.body.style.overflow = 'hidden'; // Disable scrolling in the background
      }

      function closeModal(modalId) {
          document.querySelector(modalId).style.display = 'none';
          document.body.style.overflow = ''; // Enable scrolling in the background
      }
  </script>

</body>
</html>
