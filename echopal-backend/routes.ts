import express, { Request, Response } from "express";
import { getHealthStatus, getPingMessage } from "./logic";

const router = express.Router();

router.get("/api/chat", async (req: Request, res: Response) => {
  try {
    const [{ ChatOllama }, { SystemMessage, HumanMessage }] = await Promise.all([
      import("@langchain/ollama"),
      import("@langchain/core/messages"),
    ]);

    const model = new ChatOllama({
      baseUrl: "http://127.0.0.1:11434",
      model: "llama3.2",
    });

    const ollamaRes = await model.invoke([
      new SystemMessage("You are an English teacher helping beginners."),
      new HumanMessage("Give me a short English dialogue about buying coffee."),
    ]);

    const content = (ollamaRes as any)?.content ?? ollamaRes;
    res.json({ content });
  } catch (err) {
    console.error("/api/chat error:", err);
    res.status(500).json({ error: "chat failed" });
  }
});

// Health check
router.get("/health", (req: Request, res: Response) => {
  res.json(getHealthStatus());
});

// Example API route
router.get("/api/ping", (req: Request, res: Response) => {
  res.json(getPingMessage());
});

export default router;
