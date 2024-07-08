const getregistro = (formulario) => {
    const { nombre, apellido, edad, email, password, sucursales, servicios, contratacion, pago } = formulario.elements;
    return {
        nombre: nombre.value,     
        apellido: apellido.value,
        edad: edad.value,
        email: email.value,
        password: password.value, // Cambiado a password para coincidir con el backend
        sucursales: sucursales.value,
        servicios: servicios.value,
        contratacion: contratacion.value,
        pago: pago.value,
        }
    };
const formulario = document.getElementById('formulario');
formulario.addEventListener("submit", async function(event) {
    event.preventDefault();
    const data = getregistro(formulario);

    try {
        const response = await fetch('/usuario', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(data),
        });
        const resultado = await response.json();
        console.log('Respuesta del servidor:', resultado);
        alert('Usuario creado exitosamente');
        formulario.reset(); // Limpiar el formulario después de enviar los datos
    } catch (error) {
        console.error('Error al enviar datos al servidor:', error);
        alert('Hubo un error al intentar registrar al usuario');
    }
});
                   
