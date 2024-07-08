import express from 'express';
import pool from './config/db.js';
//import 'dotenv/config';

// Import required modules

// Create an Express app
const app = express();

const puerto = process.env.PORT || 3000;
// Enable JSON parsing for request bodies
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(express.static('public'));
app.get("/", function(req,res){
   console.log("contratacion")})

app.get('/usuario', async (req, res) => {
    const sql = `SELECT usuario.id_usuario, usuario.nombre , usuario.apellido, usuario.edad, usuario.email, usuario.password, 
                sucursales.nombre_sucursal as sucursal,sucursales.direccion, sucursales.wasap, 
                servicios.clase, servicios.diasHorarios as horario, servicios.profesor, 
                contratacion.tipo_contratacion as contratacion, contratacion.precio, 
                pagos.pago as pago 
                FROM usuario 
                JOIN sucursales ON usuario.id_sucursales = sucursales.id_sucursales 
                JOIN servicios ON usuario.id_servicios =servicios.id_servicios 
                JOIN contratacion on usuario.id_contratacion= contratacion.id_contratacion 
                JOIN pagos ON usuario.id_formaPago = pagos.id_formaPago 
                ORDER BY usuario.apellido ASC  `;   
    try {
        const connection = await pool.getConnection()
        const [rows] = await connection.query(sql);
        connection.release();
        res.json(rows);

    } catch (error) {
        res.send(500).send('Internal server error')
    }

});

//read a specific resource
app.get('/usuario/:id', async (req, res) => {
    const id= req.params.id
    const sql = `SELECT usuario.id_usuario, usuario.nombre , usuario.apellido, usuario.edad, usuario.email,usuario.password, 
                sucursales.nombre_sucursal as sucursal,sucursales.direccion, sucursales.wasap, 
                servicios.clase, servicios.diasHorarios as horario, servicios.profesor, 
                contratacion.tipo_contratacion as contratacion, contratacion.precio, 
                pagos.pago as pago 
                FROM usuario 
                JOIN sucursales ON usuario.id_sucursales = sucursales.id_sucursales 
                JOIN servicios ON usuario.id_servicios =servicios.id_servicios 
                JOIN contratacion on usuario.id_contratacion= contratacion.id_contratacion 
                JOIN pagos ON usuario.id_formaPago = pagos.id_formaPago 
                WHERE usuario.id_usuario = ?
                ORDER BY usuario.apellido ASC  `;
    try {
        const connection = await pool.getConnection()
        const [rows] = await connection.query(sql,[id]);
        connection.release();
        console.log("Id usuario: " + id, rows[0])
        res.json(rows[0]);

    } catch (error) {
        res.send(500).send('Internal server error')
    }

});
// Create a new resource
app.post('/usuario', async (req, res) => {
    const usuario = req.body;
    const sql = `INSERT INTO usuario SET ?`;

    try {
        const connection = await pool.getConnection()
        const [rows] = await connection.query(sql, [usuario]);
        connection.release();
        console.log(rows)
        res.json(rows);
        res.send(`
            <h1>Usuario creado con id: ${rows.insertId}</h1>
        `);
    } catch (error) {
        //res.send(500).send('Internal server error')
        console.error('Error en la consulta SQL:',error);
        res.status(500).send('Internal server error')
    }
});

// Update a specific resource
app.put('/usuario/:id', async (req, res) => {
    const id = req.params.id;
    const usuario = req.body;

    const sql = `UPDATE usuario SET ? WHERE id_usuario = ?`;
    
    try {
        const connection = await pool.getConnection()
        const [rows] = await connection.query(sql, [usuario, id]);
        connection.release();
        console.log(rows)
        //res.json(rows);
        res.send(`
            <h1>Usuario actualizado id: ${id}</h1>
        `);
    } catch (error) {
        //res.send(500).send('Internal server error')
        console.error('Error en la consulta SQL:', error);
        res.status(500).send('Internal server error');
    }

});

// Delete a specific resource
app.delete('/usuario/:id', async (req, res) => {
    const id = req.params.id;
    const sql = `DELETE FROM usuario WHERE id_usuario = ?`;

     try {
        const connection = await pool.getConnection()
        const [rows] = await connection.query(sql, [id]);
        connection.release();
        console.log(rows);
        //req.json(rows);
        res.send(`
            <h1>Usuario borrado id: ${id}</h1>
        `);
    } catch (error) {
        res.send(500).send('Internal server error')
    }
});

// Start the server
app.listen(puerto, () => {
    console.log('Server started on port 3000');
});