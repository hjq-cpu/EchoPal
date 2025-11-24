import express, { Request, Response } from 'express';
import cors from 'cors';
import routes from './routes';

const app = express();
const PORT = process.env.PORT || 3001;

// Middlewares
app.use(cors());
app.use(express.json());

// Mount routes
app.use('/', routes);

// Fallback route
app.use((req: Request, res: Response) => {
  res.status(404).json({ error: '找不到页面' });
});

// Start server
app.listen(PORT, () => {
  const url = `http://localhost:${PORT}/`;
  console.log(`EchoPal backend server listening on ${url}`);
});