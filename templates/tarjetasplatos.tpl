<div class="container_tarjeta">
    {foreach from=$platos item=plato}
        <div class="card">
          
            <div class="content">
                <h3>{$plato->nombre}</h3>
                <h4>Nacionalidad: ${$plato->nacionalidad}</h4>
                <a href="detalle/{$plato->id}">Detalles</a>
                {if $username}
                    <a href="formEditarPlato/{$plato->id}">Editar</a>
                    <a href="eliminarPlato/{$plato->id}">Eliminar</a>
                {/if}
            </div>
        </div>
    {/foreach}
</div>