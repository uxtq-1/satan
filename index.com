<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>OPS Online Support - Futuristic Achievements</title>
  
  <!-- Google Fonts for a modern look -->
  <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap" rel="stylesheet">
  <!-- Animate.css for additional entrance animations -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
  
  <link rel="stylesheet" href="css/global.css">
  <link rel="stylesheet" media="(max-width:768px)" href="css/small-screens.css">
  
  <style>
    /* Global Styles */
    html, body {
      margin: 0;
      padding: 0;
      height: 100%;
      font-family: 'Montserrat', sans-serif;
      background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
      color: #ffffff;
      overflow: hidden;
    }
    /* Particles container for dynamic background */
    #particles-js {
      position: absolute;
      width: 100%;
      height: 100%;
      z-index: -1;
    }
    /* Landing container center-aligned */
    .landing-container {
      width: 80%;
      max-width: 1200px;
      margin: 0 auto;
      padding-top: 15%;
      text-align: center;
      position: relative;
      z-index: 10;
    }
    /* Typewriter effect updated for more dramatic impact */
    .typewriter-text {
      font-size: 2rem;
      font-weight: 700;
      margin-bottom: 30px;
      overflow: hidden;
      white-space: nowrap;
      border-right: 4px solid #00ffff;
      width: 0;
      animation: typing 4s steps(40, end) forwards, blink 0.7s step-end infinite;
    }
    @keyframes typing {
      from { width: 0; }
      to { width: 100%; }
    }
    @keyframes blink {
      from, to { border-color: transparent; }
      50% { border-color: #00ffff; }
    }
    /* Animated subheading appearance */
    .subheading {
      font-size: 1.25rem;
      margin-bottom: 40px;
      opacity: 0;
      animation: fadeInUp 1.5s forwards 3s;
    }
    @keyframes fadeInUp {
      from { transform: translateY(20px); opacity: 0; }
      to { transform: translateY(0); opacity: 1; }
    }
    /* Counters styling */
    .achievement-counters {
      display: flex;
      justify-content: center;
      gap: 50px;
      margin-top: 40px;
    }
    .counter {
      font-size: 2.5rem;
      font-weight: bold;
    }
    /* Description styling */
    .description {
      margin: 30px auto;
      font-size: 1.1rem;
      max-width: 800px;
      line-height: 1.6;
    }
    /* Call-to-Action Button */
    .cta-button {
      margin-top: 50px;
      padding: 15px 40px;
      font-size: 1.2rem;
      background-color: #00ffff;
      color: #000;
      border: none;
      border-radius: 50px;
      cursor: pointer;
      transition: background-color 0.3s, transform 0.3s;
    }
    .cta-button:hover {
      background-color: #7e69ab;
      transform: scale(1.05);
    }
  </style>
  
  <script src="https://cdn.jsdelivr.net/npm/particles.js@2.0.0/particles.min.js"></script>
  <script>
    // Navigation function to move to index page
    function goToMainPage() {
      window.location.href = "index.html";
    }
  </script>
</head>
<body>
  <div id="particles-js"></div>
  <main class="landing-container animate__animated animate__fadeIn">
    <section class="intro">
      <div class="typewriter-text">
        OPS Online Support: Achieving Futuristic Results...
      </div>
      <div class="subheading">
        Experience unparalleled efficiency, speed, and customer satisfaction.
      </div>
    </section>
    <section class="statistics achievement-counters">
      <div class="counter" id="counter-efficiency">0%</div>
      <div class="counter" id="counter-response">0s</div>
      <div class="counter" id="counter-satisfaction">0%</div>
    </section>
    <section class="info">
      <div class="description">
        Welcome to the future of remote assistance. Our state-of-the-art platform harnesses advanced technologies to deliver lightning-fast support and operational excellence. Step into a world where efficiency meets innovation and experience service redefined.
      </div>
    </section>
    <section class="navigation">
      <button class="cta-button" onclick="goToMainPage()">Enter Portal</button>
    </section>
  </main>
  
  <script>
    // Initialize particles.js background effect
    particlesJS('particles-js', {
      particles: {
        number: { value: 120, density: { enable: true, value_area: 800 } },
        color: { value: '#00ffff' },
        shape: { type: 'circle' },
        opacity: { value: 0.5, random: false },
        size: { value: 3, random: true },
        line_linked: { enable: true, distance: 150, color: '#00ffff', opacity: 0.4, width: 1 },
        move: { enable: true, speed: 3, direction: 'none', random: false, straight: false, out_mode: 'out' }
      },
      interactivity: {
        detect_on: 'canvas',
        events: { onhover: { enable: true, mode: 'repulse' }, onclick: { enable: true, mode: 'push' }, resize: true },
        modes: { repulse: { distance: 100, duration: 0.4 } }
      }
    });

    // Counter animation function
    function animateCounter(id, target, suffix) {
      const element = document.getElementById(id);
      let current = 0;
      const increment = target / 200;
      const interval = setInterval(() => {
        current += increment;
        if (current >= target) {
          current = target;
          clearInterval(interval);
        }
        element.textContent = Math.floor(current) + suffix;
      }, 10);
    }
    animateCounter('counter-efficiency', 95, '%');
    animateCounter('counter-response', 1, 's');
    animateCounter('counter-satisfaction', 98, '%');
  </script>
</body>
</html>
