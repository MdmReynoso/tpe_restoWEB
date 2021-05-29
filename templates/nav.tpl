<div class="user">
    {if $username}
        <p>{$username}</p>
    {/if}
</div>


 


<nav>
    <ul class="navigation">

               <li class="item"><a class="botones" href="">Home</a></li>
                    <li class="item"><a class="botones" href="platos">Nuestros Platos</a></li>
                      <li class="item"><a class="botones" href="admin">Admin</a></li>
                    {if $username}
                   
          
            <li class="item_log"><a class="botones" href="logout">Logout</a></li>
            <li class="item_log"><a class="botones" href="logout">Logout</a></li>
        {else}
            <li class="item_log"><a class="botones" href="formRegistro">Registrarse</a></li>
            <li class="item"><a class="botones" href="login">Login</a></li>
        {/if}
    </ul>
    <img src="imagenes/logo.png" alt="logo">
</nav>
   