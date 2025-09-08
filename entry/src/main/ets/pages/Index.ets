import { SelectTopic } from '../components/SelectTopic';
import { QuizPage } from '../components/QuizPage';
import { QuizResultPage } from '../components/QuizResultPage';

@Entry
@Component
struct Index {
  @State currentPage: string = 'topics';
  @State selectedTopic: string = '';
  @State resultScore: number = 0;

  private startQuiz = (topic: string) => {
    this.selectedTopic = topic;
    this.currentPage = 'quiz';
    console.info('Starting quiz for topic:', topic);
  }

  private backToTopics = () => {
    this.currentPage = 'topics';
    this.selectedTopic = '';
    console.info('Returning to topics selection');
  }

  private showResult = (score:number) => {
    this.resultScore = score;
    this.currentPage = 'result';
  }

  build() {
    Stack() {
      if (this.currentPage === 'topics') {
        SelectTopic({
          onStartQuiz: this.startQuiz
        })
      } else if (this.currentPage === 'quiz') {
        QuizPage({
          topic: this.selectedTopic,
          onBackToTopics: this.backToTopics,
          onShowResult: this.showResult
        })
      } else if (this.currentPage === 'result') {
        QuizResultPage({
          quizResult: this.resultScore,
          onQuizFinish: this.backToTopics
        })
      }
    }
    .width('100%')
    .height('100%')
  }
}