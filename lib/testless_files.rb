require "testless_files/version"

module TestlessFiles

  def self.verify
    check_testless_files do |testless_files|
      puts verify_message(testless_files)
    end
  end

  def self.verify!
    check_testless_files do |testless_files|
      raise verify_message(testless_files)
    end
  end

  private

  def self.verify_message testless_files
    "\n There are files without test! - The following .rb files are not tested (or are under a not conventional namespace) : "+testless_files
  end

  def self.check_testless_files
    folders = ["models", "controllers", "helpers", "mailers", "workers", "services"]
    test_files = Dir["spec/**/*.rb"]
    files = []
    testless_files = []

    folders.each do |diretorio|
      Dir["app/#{diretorio}/**/*.rb"].each { |file| files << file }
    end

    files.each do |file|
      testless_file = true
      test_files.each do |test_file|
        if file.gsub('app/','').downcase == test_file.gsub('spec/','').gsub('_spec','').downcase
          testless_file = false
          break
        end
      end
      testless_files << file if testless_file
    end

    unless testless_files.empty?
      string_testless_files = ""
      testless_files.each { |testless_file| string_testless_files = string_testless_files+"\n - #{testless_file} " }
      yield(string_testless_files)
      
    end
  end
end
