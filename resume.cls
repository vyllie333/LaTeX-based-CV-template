%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Vyvyllie

% This resume template is tailored for job applications and the sections below contain simulated information to illustrate how to present your experience and skills.

% Github: https://github.com/vyllie333/LaTeX-based-CV-template
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% ------------ Begin format ------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[Resume class]
\usepackage{fontawesome5}
\LoadClass[12pt,letterpaper]{article}

% ------------ Format for resume ------------

% set document margins
\usepackage[left=0.5in,top=0.4in,right=0.5in,bottom=0.4in]{geometry}
 % Remove paragraph indentation
\usepackage[parfill]{parskip}
\setlength{\parskip}{2.5ex plus 0.2ex minus 0.2ex}
% Add script
\usepackage{etoolbox}
\usepackage{keycommand}
\usepackage{xstring}
\usepackage{hyperref}
\usepackage{xcolor}
\definecolor{lightblue}{RGB}{130, 189, 149}
\hypersetup{
    colorlinks=true,
    linkcolor=blue,
    urlcolor=lightblue,
}
% Setspace
\usepackage{setspace} 
\singlespacing
% Including images
\usepackage{graphicx}
% Wrapping text around the image
\usepackage{wrapfig}
% Drawing shapes like circles
\usepackage{tikz}
% Delete page number
\pagestyle{empty}

% Font Latin Modern
\usepackage[T1]{fontenc}
\usepackage{lmodern}
% Sans-serif for default
\renewcommand{\familydefault}{\sfdefault}
\linespread{1.2}

% ------------ Utilities ------------
% Separation x|x|x
\def \separator {
    \textbf{\Large\textbullet}
}
% Link for profile
\newcommand{\email}[1]{\href{mailto:#1}{#1}}%
\newcommand{\profilelink}[1]{\href{https://#1}{#1}}%
\newcommand{\linkedin}[1]{\href{https://www.#1}{#1}}%
\newcommand{\linkproject}[1]{\href{#1}{\textcolor{blue}{Source}}} 

\newcommand{\isA}[1]{
    \expandafter\ifstrequal\expandafter{#1}{default}{}{a}
}
% Edit for title
\newcommand\sectionTitle[1]{%
    \begingroup
        \textbf{\MakeUppercase{#1}}
        \vspace{0.4em}
        \hrule
        \vspace{-0.3em}
    \endgroup
}%

% ------------------------------------




% ------------- Header --------------
\newcommand\printNameTitle[1]{%
    \begingroup
        \hfill{\MakeUppercase{\Huge\bfseries #1}}\hfill
        \break
        \vspace{-0.5em}
        \hrule
    \endgroup
}%

\newkeycommand{\introduction}[
    fullname,
    role,
    email,
    phone,
    linkedin,
    github,
    imagepath
]{%
    \begin{minipage}{0.2\textwidth} % Left-image
        \centering
        \begin{tikzpicture}
            % Clip image into circle
            \clip (0,0) circle(3.0cm); 
            \node at (0,0) {\includegraphics[width=6.5cm,height=6.5cm]{\commandkey{imagepath}}};
        \end{tikzpicture}
    \end{minipage}%
    \begin{minipage}{0.75\textwidth} % Right intro
        \flushright
        {\Huge\bfseries\MakeUppercase{\commandkey{fullname}}}\\
        \vspace{0.4em}
        \textbf{\commandkey{role}} \\
        \vspace{1em}
        % Contact info
        \faPhone\ \ifcommandkey{phone}{\commandkey{phone}}{}%
        \hspace{1em}
        \faEnvelope\ \email{\commandkey{email}} \\
        \vspace{0.3em}
        \faLinkedin\ \underline{\linkedin{\commandkey{linkedin}}}%
        \hspace{1em}
        \faGithub\ \underline{\profilelink{\commandkey{github}}}%
    \end{minipage}%
}%

% -----------------------------------




% ------------ Summary --------------
\newcommand{\summary}[1]{%
    \sectionTitle{Summary}%
    #1
}%

% -----------------------------------




% ------------ Education ------------
\newenvironment{educationSection}[1]{%
    \sectionTitle{#1}%
}%

\newkeycommand{\educationItem}[
    university,
    program,
    grade,
    graduation,
    thesis
]{%
    {% line 1
        \textbf{\commandkey{program}}, \commandkey{grade}
    } \hfill {%
        \commandkey{graduation}%
    } \\ % line end
    {% line 2
        \commandkey{university}%
    } \\ % line end
    {% line 3
        \commandkey{thesis}%
    }
}%

% ------------------------------------




% -------------- Skills --------------
\newenvironment{skillsSection}[1]{%
    \sectionTitle{#1}%
}%

\newkeycommand{\skillItem}[
    category,
    skills
]{%
    {%
        \bf \commandkey{category}:
    } {%
        \commandkey{skills}%
    }
}%

% ------------------------------------





% ----------------- Experiment -------------
\newenvironment{experimentSection}[1]{%
    \sectionTitle{#1}%
    \begin{list}{}{
        \setlength{\leftmargin}{0em}
    }%
        \item[]%
    }{%
    \end{list}%
}%

\newkeycommand{\experimentItem}[%
  company,
  duration,
  location,
  position
]{%
  % Dòng Company – Duration
  \noindent
  \makebox[\textwidth][s]{%
    \textbf{\commandkey{company}}%
    \hfill
    \commandkey{duration}%
  } \\ % Dòng Position – Location
  \noindent
  \makebox[\textwidth][s]{%
    \textbf{\commandkey{position}}%
    \hfill
    \commandkey{location}%
  }
}


% ---------------------------------------




% ----------------- Project -------------
\newenvironment{projectSection}[1]{%
    \sectionTitle{#1}%
    \begin{list}{}{
        \setlength{\leftmargin}{0em}
    }%
        \item[]%
    }{%
    \end{list}%
}%

\newkeycommand{\projectItem}[
    title, 
    duration, 
    keyHighlight, 
    link
] {%
    % Line 1
    \noindent
    \textbf{\commandkey{title}}%
    \IfStrEq{\commandkey{link}}{}{}{
        \textcolor{lightblue}{\href{\commandkey{link}}{[Source]}}%
    }\hfill {%
        \commandkey{duration}%
    } \\ % Line 2
    \commandkey{keyHighlight}%
}%



% {%
%     \textbf{%
%         \commandkey{title}%
%     } \hfill {%
%         \commandkey{duration}%
%     } \\ 
%     {%
%         \IfStrEq{\commandkey{link}}{}{}{
%         \textcolor{lightblue}{\href{\commandkey{link}}{[Source]}}%
%     } \\ % 
%         \commandkey{keyHighlight}%
%     }
% }%

% ---------------------------------------




% ----------------- Activities -------------
\newenvironment{activitiesSection}[1]{%
    \sectionTitle{#1}%
    \begin{list}{}{ % List for each highlight in the section
        \setlength{\leftmargin}{0em} % Margin within the section
    }%
        \item[]%
    }{%
    \end{list}%
}%


\newkeycommand{\activities}[title, duration, keyHighlight]{%
    \textbf{%
        \commandkey{title}%
    } \hfill {%
        \commandkey{duration}%
    } \\ {%
        \commandkey{keyHighlight}%
    }
}%

% ---------------------------------------




% ----------------- Certificates -------------
\newenvironment{certificatesSection}[1]{%
    \sectionTitle{#1}%
}%

\newkeycommand{\certificates}[title, duration, keyHighlight]{%
    \textbf{%
        \commandkey{title}%
    } \hfill {%
        \commandkey{duration}%
    } \\ {%
        \commandkey{keyHighlight}%
    }
}%

