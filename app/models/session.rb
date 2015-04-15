class Session
  attr_accessor :session_id, :session_code, :session_name,
    :begin_date, :end_date, :enrollment_open_date, :academic_career,
    :institution, :term

  def initialize(attributes)
    self.academic_career = AcademicCareer.new(attributes)
    self.institution = Institution.new(attributes)
    self.term = Term.new(attributes)
    self.session_id = institution.abbreviation + "_" +
      academic_career.academic_career_id + "_" +
      term.strm + "_" +
      attributes["session_code"]
    self.session_code = attributes["session_code"]
    self.session_name = attributes["xlatlongname"]
    self.begin_date = attributes["sess_begin_dt"].strftime("%F")
    self.end_date = attributes["sess_end_dt"].strftime("%F")
    self.enrollment_open_date = attributes["enroll_open_dt"].strftime("%F")
  end

  def type
    "session"
  end

  def hash
    session_id.hash
  end

  def ==(x)
    session_id == x.session_id
  end

  alias_method :eql?, :==

  def self.all
    SessionSource.all
  end
end