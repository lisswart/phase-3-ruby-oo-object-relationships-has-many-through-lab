require "pry"
require_relative "./appointment.rb"
require_relative "./doctor.rb"

class Patient
    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def new_appointment(date, doctor)
        # given a date and doctor, creates a new appointment belonging to that patient
        Appointment.new(date, self, doctor)
    end

    def appointments
        # returns all appointments associated with this Patient
        Appointment.all.select {|appointment| appointment.patient == self}
    end

    def doctors
        # has many doctors, through appointments
        appointments.map do |appointment|
            appointment.doctor
        end
    end
end

# binding.pry