module Pubid::Ccsds::Renderer
  class Base < Pubid::Core::Renderer::Base
    TYPE = "".freeze

    def render_identifier(params)
      "%{publisher} %{series}%{number}%{part}%{type}%{edition}%{retired}" % params
    end

    def render_part(part, _opts, _params)
      ".#{part}"
    end

    def render_type(type, _opts, _params)
      "-#{type}"
    end

    def render_edition(edition, _opts, _params)
      "-#{edition}"
    end

    def render_retired(retired, _opts, _params)
      "-S" if retired
    end
  end
end
