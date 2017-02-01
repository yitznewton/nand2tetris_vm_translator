require_relative 'arithmetic'
require_relative 'compare'
require_relative 'negate'
require_relative 'not'
require_relative 'push'

class Command
  MAP = {
    'push' => Push,
    'add'  => Arithmetic,
    'sub'  => Arithmetic,
    'eq'   => Compare,
    'gt'   => Compare,
    'lt'   => Compare,
    'neg'  => Negate,
    'and'  => Arithmetic,
    'or'   => Arithmetic,
    'not'  => Not
  }

  def self.parse(command)
    MAP.fetch(first_word(command)).new(command)
  end

  def self.first_word(command)
    finish = (command.index(' ') || 0) - 1
    command[0..finish]
  end
end
