const getregistro = (formulario) => {
    const {nombre,apellido,edad,email,password,sucursal,servicios, pago} = formulario.elements;
    return {
        nombre : nombre.value,
        apellido:apellido.value,
        edad:edad.value,
        email:email.value,
        password:password.value,
        sucursal:sucursal.value,
        servicios:servicios.value, 
        pago:pago.value,
    };
};
/*https://www.youtube.com/watch?v=LyGy2J-ws9k*/
const registroFormulario = document.getElementById('registroFormulario');
registroFormulario.addEventListener("submit",function (event){
    event.preventDefault();
    const formulario = event.target;
    const data = getregistro(formulario);
});



                   
