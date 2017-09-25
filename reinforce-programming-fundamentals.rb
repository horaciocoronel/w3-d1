project = {
  committee: ["Stella", "Salma", "Kai"],
  title: "Very Important Project",
  due_date: "December 1, 2019",
  id: "3284",
  steps: [
    {description: "conduct interviews",
     due_date: "August 1, 2018"
    },
    {description: "code of conduct",
     due_date: "January 1, 2018"
    },
    {description: "compile results",
     due_date: "November 10, 2018"
    },
    {description: "version 1",
     due_date: "January 15, 2019"
    },
    {description: "revisions",
     due_date: "March 30, 2019"
    },
    {description: "version 2",
     due_date: "July 12, 2019"
    },
    {description: "final edit",
     due_date: "October 1, 2019"
    },
    {description: "final version",
     due_date: "November 20, 2019"
   }
  ]
}

def members(project)
  index = 0
  project[:steps].each do | step_hash |
    step_hash[:person] = project[:committee][index]
      if index < 2
        index += 1
      else
        index = 0
      end
  end
end

def equal_assignments(project)
  project[:steps].last(2).each do | step_hash | #We use .each again because we need to loop inside the array that was returned to us when we executed .last
    step_hash[:person] = project[:committee]
  end
end
# project[:steps].each do |step_hash|
#   step_hash[:person] = "Sal"
# end

members(project)
equal_assignments(project)

puts project[:steps].inspect
