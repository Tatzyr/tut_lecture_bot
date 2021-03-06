module TUTLectureBot
  module NormalizeString
    DEPARTMENT_TABLE = {
      "機械" => "1系", # Mechanical Engineering
      "電気・電子情" => "2系", # Electrical and Electronic Information Engineering
      "電気電子情報" => "2系", # Electrical and Electronic Information Engineering
      "情報・知能" => "3系", # Computer Science and Engineering
      "応用・生命" => "4系", # Applied Chemistry and Life Science
      "建築・都市" => "5系", # Architecture and Civil Engineering
      "共通" => "共通", # All Departments
    }

    def normalized_teacher
      teacher.gsub(/[\s　]+/, " ")
    end

    def normalized_day
      day.gsub(/\/0/, "/").sub(/\A\d{4}\//, "")
    end

    def normalized_grade
      grade.split(",").map(&:strip).join("/")
    end

    def normalized_department
      department.split(",").map(&:strip).map { |d| DEPARTMENT_TABLE[d] || "エラー" }.sort.join("/")
    end
  end
end
