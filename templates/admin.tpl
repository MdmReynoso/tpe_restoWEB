{include file="header.tpl"}
<div class="contenedor">
    <div class="encabezado">
        {include file="nav.tpl"}
    </div>
    <h1>Admin</h1>
    <div class="contenedor_admin">
        {include file="editar.categorias.admin.tpl"}
        {include file="agregar.categoria.tpl"}
    </div>
    <div class="contenedor_admin">
        {include file="editar.platos.admin.tpl"}
        {include file="agregar.plato.tpl"}
    </div>
    <div class="contenedor_admin">
        {include file="eliminar.categoria.tpl"}
        {include file="eliminar.categoria.tpl"}
    </div>
</div>

{include file="footer.tpl"}