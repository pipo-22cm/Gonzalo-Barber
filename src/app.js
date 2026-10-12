import expres from 'express'
import cookieParser from 'cookie-parser'
import cors from 'cors'

const app = expres ()

app.use(cors({
    origin: 'http://localhost:5173',
    credentials: true // Permite el envío de cookies entre React y Express
}))


app.use(expres.json())
app.use(cookieParser())


export default app