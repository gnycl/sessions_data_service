class InstitutionSource < DataSource

  def self.instantiate(attributes, _)
    Institution.new(attributes)
  end

end