import { UsuarioModel } from "../models/usuarioModel.js";
import bcrypt from "bcryptjs";


export class AuthController {

    static async createUsuario (req,res){
        
        try {
            const { nombre, apellido, email, password, telefono, rol } = req.body;
            const usuarioExistente = await UsuarioModel.buscarPorEmail(email);
                if(usuarioExistente){
                return res.status(400).json({mesagge: 'El correo electronico ya está registrado.'})
                }
            const saltRounds = 10;
            const passwordHash = await bcrypt.hash(password, saltRounds);
            const idUsuario = await UsuarioModel.createUsuario({
                nombre,
                apellido,
                email,
                password: passwordHash,
                telefono,
                rol
            })
            return res.status(201).json({
                message: 'Usuario registrado con éxito',
                id: idUsuario
            })
        }catch(error){
            return res.status(500).json({ error: error.message })
        }
    }


}