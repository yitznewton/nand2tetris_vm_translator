require_relative 'arithmetic'
require_relative 'compare'
require_relative 'goto'
require_relative 'if_goto'
require_relative 'label'
require_relative 'negate'
require_relative 'not'
require_relative 'pop'
require_relative 'push'
require_relative 'pointer_pop'
require_relative 'pointer_push'
require_relative 'static_pop'
require_relative 'static_push'

class Command
  BASIC_COMMANDS = {
    'push'    => Push,
    'pop'     => Pop,
    'add'     => Arithmetic,
    'sub'     => Arithmetic,
    'eq'      => Compare,
    'gt'      => Compare,
    'lt'      => Compare,
    'neg'     => Negate,
    'and'     => Arithmetic,
    'or'      => Arithmetic,
    'not'     => Not,
    'label'   => Label,
    'goto'    => Goto,
    'if-goto' => IfGoto
  }

  POINTER_SEGMENT = 'pointer'
  STATIC_SEGMENT  = 'static'

  POINTER_COMMANDS = {
    'push' => PointerPush,
    'pop'  => PointerPop
  }

  STATIC_COMMANDS = {
    'push' => StaticPush,
    'pop'  => StaticPop
  }

  def self.parse(command)
    words = words(command)
    command_from(words)
  end

  def self.command_from(words)
    if pointer?(words)
      pointer_command(words)
    elsif static?(words)
      static_command(words)
    else
      basic_command(words)
    end
  end

  def self.pointer?(words)
    words[1] == POINTER_SEGMENT
  end

  def self.static?(words)
    words[1] == STATIC_SEGMENT
  end

  def self.pointer_command(words)
    POINTER_COMMANDS.fetch(words[0]).new(words)
  end

  def self.static_command(words)
    STATIC_COMMANDS.fetch(words[0]).new(words)
  end

  def self.basic_command(words)
    BASIC_COMMANDS.fetch(words[0]).new(words)
  end

  def self.words(command)
    command.split(' ')
  end
end
