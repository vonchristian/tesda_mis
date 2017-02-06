class RegistryParser
  def initialize(registry)
    @registry = registry
  end
  def parse_for_records(registry)
    find_or_create_region
    find_or_create_province
    find_or_create_trainee
  end
end
