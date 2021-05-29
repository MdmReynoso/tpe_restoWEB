<div class="container_tarjeta">

    <div class="card_detalle">
        
        <div class="contenido_detalle">
            <h3>Platos: {$plato->nombre}</h3>
            <p class="info"><span>Nacionalidad:</span> {$platos->nacionalidad}</p>
            <p class="info"><span>Detalles:</span> {$plato->detalle}</p>

            {if $username}
                <a href="formEditarPlato/{$plato->id}">Editar</a>
                <a href="eliminarPlato/{$plato->id}">Eliminar</a>
            {/if}
        </div>
    </div>

</div>