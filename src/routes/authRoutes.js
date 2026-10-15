import { Router } from 'express';
import { AuthController } from '../controllers/authController.js';

const router = Router();


router.post('/register', AuthController.createUsuario);
router.post('/login', AuthController.loginUsuario);


export const authRoutes = router;