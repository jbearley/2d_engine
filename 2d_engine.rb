#name = gets

#puts "my name is #{name}"


class Particle
    attr_accessor :x, :y, :vx, :vy
  
    def initialize(x, y, vx, vy)
      @x = x
      @y = y
      @vx = vx
      @vy = vy
    end
  
    def update(dt)
      @vy -= 9.8 * dt  # Apply gravity
      @x += @vx * dt
      @y += @vy * dt
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
  
  dt = 0.1  # Time step for simulation
  num_steps = 100  # Number of simulation steps
  
  num_steps.times do
    particles.each { |particle| puts "(#{particle.x}, #{particle.y})" }
    physics_engine.update(dt)
  end