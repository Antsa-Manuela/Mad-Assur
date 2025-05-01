<?php
include('header.php');
include('details.php');
?>

<style>
:root {
  --primary: #2c3e50;
  --accent: #e74c3c;
  --success: #27ae60;
  --info: #3498db;
  --warning: #f39c12;
  --danger: #e74c3c;
  --bg: #e4fff4;
  --white: #ffffff;
  --text-light: #f8f9fa;
  --text-dark: #2c3e50;
  --gray-light: #bdc3c7;
}

body {
  font-family: 'Open Sans', sans-serif;
  background-color: #e4fff4;
  margin: 0;
  padding: 0;
  line-height: 1.6;
  color: var(--text-dark);
}

.container {
  max-width: 70%;
  margin: auto;
  background: var(--bg);
  /* border-radius: 12px;
  box-shadow: 0 4px 20px rgba(0,0,0,0.08); */
}

.metrics-grid {
  display: grid;
  /* grid-template-columns: 1fr 1fr;
  gap: 2rem;
  margin: 3rem 0; */
}

.metric-card {
  /* background: var(--white);
  border-radius: 10px; 
  padding: 1.5rem;*/
  /* box-shadow: 0 4px 12px rgba(0,0,0,0.05);
  transition: transform 0.3s ease; */
}

/* .metric-card:hover {
  transform: translateY(-5px);
} */

.discuss-btn {
  display: flex;
  justify-content: center;
  margin: 0;
}

.discuss-btn a {
  background: var(--white);
  color: #eb723d;
  padding: 0.2vw 1.5vw;
  border: solid 1px #eb723d;
  border-radius: 3vw;
  text-transform: uppercase;
  text-decoration: none;
  transition: all 0.3s ease;
  /* box-shadow: 0 2px 8px rgba(231, 76, 60, 0.3); */
}

.discuss-btn a:hover {
  padding: 0.5rem 1rem;
  /* transform: translateY(-2px);
  box-shadow: 0 4px 12px rgba(231, 76, 60, 0.4);
  background: #c0392b; */
}

@media (max-width: 768px) {
  .container {
    padding: 1.5rem;
    margin: 1rem;
  }
  
  .metrics-grid {
    grid-template-columns: 1fr;
  }
}

@media (max-width: 480px) {
  .container {
    padding: 1rem;
  }
  
  .discuss-btn a {
    padding: 10px 20px;
    font-size: 0.9rem;
  }
}
</style>

<div class="container">

  
  <div class="metrics-grid">
    <?php include('rse.php'); ?>
    <?php include('capital_humain.php'); ?>
    <?php include('experience_humain.php'); ?>
    <?php include('impact_local.php'); ?>
  </div>
</div>

<?php include('footer.php'); ?>