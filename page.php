<style>
    body{
        background-color: #e4fff4;
    }
    .container {
    max-width: 800px;
    margin: auto;
    background: white;
    padding: 20px;
    border-radius: 12px;
    box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
    }
    .prendre-rdv-77 {
    display: flex;
    align-items: flex-start;
    justify-content: center;
    width: 120px;
    height: 22px;
    color: #e4fff4;
    font-size: 18px;
    font-weight: 600;
    text-align: center;
    text-transform: uppercase;
  }
  .prendre-rdv {
    width: fit-content;
    padding: 1vw;
    left: 976.615px;
    background: #eb723d;
    border-radius: 7px;
  }
  a{
    color: #eb723d;
    text-decoration: none;
    font-size: 13px;
}
</style>
<?php
include('header.php');
include('details.php');
?>
<div class="container">
<a href="homechat.php?id=ici" class="prendre-rdv-77"><div class="prendre-rdv">
<span>Discutons !</span>
</div>
</a>
<?php
include('rse.php');
include('capital_humain.php');
include('experience_humain.php');
include('impact_local.php');
?>
</div>
<?php
include('footer.php')
?>