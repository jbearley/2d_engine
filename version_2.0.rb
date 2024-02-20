class Particle
  attr_accessor :position_x, :position_y, :velocity_x, :velocity_y

  def initialize(position_x, position_y, velocity_x, velocity_y)
    @position_x = position_x
    @position_y = position_y
    @velocity_x = velocity_x
    @velocity_y = velocity_y
  end

  def update(dt)
    @velocity_y -= 9.8 * dt  # Apply gravity
    @position_x += @velocity_x * dt
    @position_y += @velocity_y * dt
  end
end

class PhysicsEngine
  def initialize(particles)
    @particles = particles
  end

  def update(dt)
    @particles.each { |particle| particle.update(dt) }
  end
end

# Example usage
particles = [
  Particle.new(0, 10, 1, 5),
  Particle.new(5, 15, -2, 7)
]

physics_engine = PhysicsEngine.new(particles)

time_step = 0.1  # Time step for simulation
num_steps = 100   # Number of simulation steps

num_steps.times do
  particles.each { |particle| puts "(#{particle.position_x}, #{particle.position_y})" }
  physics_engine.update(time_step)
end
