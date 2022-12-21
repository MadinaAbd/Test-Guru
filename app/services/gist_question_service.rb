class GistQuestionService

  Result = Struct.new(:success?, :html_url)

  def initialize(question, client = default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    response = @client.create_gist(gist_params)
    Result.new(response.html_url.present?, response.html_url)
  end

  private

  def gist_params
    {
      description: "A question about #{@test.title} from TestGuru",
      public: true,
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body, *@question.answers.pluck(:body).join("\n")]
  end

  def default_client
    Oktokit::Client.new(access_token: ENV['GITHUB_GIST_TOKEN'])
  end
end
