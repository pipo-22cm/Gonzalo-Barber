import { Router } from 'express';
import { AuthController } from '../controllers/authController.js';

const router = Router();


router.post('/register', AuthController.createUsuario);

export const authRoutes = router;