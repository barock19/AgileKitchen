class ActiveRecord::Base
  def self.any_of( *queries )
    queries = queries.map do |query|
      query = where( query ) if [ String, Hash ].any? { |type| query.kind_of? type }
      query = where( *query ) if query.kind_of?( Array )
      query.arel.constraints.reduce( :and )
    end
 
    where( queries.reduce( :or ) )
  end
end