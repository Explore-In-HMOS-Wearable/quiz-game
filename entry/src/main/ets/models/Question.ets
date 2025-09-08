export interface Question {
  id: number;
  question: string;
  options: string[];
  correctAnswer: number;
  topic: string;
}

export interface QuizResult {
  topic: string;
  score: number;
  totalQuestions: number;
  percentage: number;
}