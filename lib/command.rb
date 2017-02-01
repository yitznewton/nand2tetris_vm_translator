require_relative 'arithmetic'
require_relative 'compare'
require_relative 'goto'
require_relative 'if_goto'
require_relative 'label'
require_relative 'negate'
require_relative 'not'
require_relative 'pop'
require_relative 'push'

class Command
  MAP = {
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

  def self.parse(command)
    words = words(command)
    MAP.fetch(words[0]).new(words)
  end

  def self.words(command)
    command.split(' ')
  end
end
