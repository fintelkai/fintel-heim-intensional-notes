\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{kvf-lecturenotes}[2015/01/05 v.1.000 Kai's document class for lecture notes]
\LoadClass[oldfontcommands,12pt]{memoir}
\renewcommand{\encodingdefault}{T1}% What's that for?
\RequirePackage[scaled=1.05,osf]{xagaramon}%
\RequirePackage[small]{eulervm}%
\RequirePackage[T1]{fontenc}%
\RequirePackage{amssymb}%
\RequirePackage{textcomp}%
\renewcommand{\bfdefault}{sb}%
\RequirePackage{stmaryrd}%
\RequirePackage{etex}
\RequirePackage[usenames,dvipsnames]{color}
\RequirePackage{graphicx}
\RequirePackage{wrapfig}
\RequirePackage{soul}
\RequirePackage{xspace}
\RequirePackage[utf8]{inputenc}
\RequirePackage{ragged2e}
\RequirePackage{csquotes}
\RequirePackage{microtype}
\RequirePackage[pdftex,plainpages=false,pdfpagelabels,bookmarks=false, pdfstartview=FitH]{hyperref}
\newcommand{\doi}[1]{\url{http://dx.doi.org/#1}}
\RequirePackage[hyperref,thref]{ntheorem}  % Replace with amstheorem
\RequirePackage{amstext,amsmath} %What of this should I use?
\RequirePackage{minitoc}
\RequirePackage{expex}
\RequirePackage{mparhack}
\RequirePackage[backend=biber,
		bibstyle=biblatex-sp-unified,
		citestyle=sp-authoryear-comp,
		maxcitenames=3,
		maxbibnames=99]{biblatex}
% 
% Hyperref Settings
%
\providecommand{\toclevel@exercise}{0}
\definecolor{linkcolour}{named}{Blue}
\hypersetup{colorlinks,breaklinks,hypertexnames=false,
            linkcolor=linkcolour,citecolor=linkcolour,
            filecolor=linkcolour, urlcolor=linkcolour}
% 
% Expex settings
%
  \lingset{%
    exskip=-0.5ex,
    interpartskip=0.5ex,
    aboveexskip=1ex,
    belowexskip=2ex,
    everygla=}
  \gathertags
          
% Macros
%
\def\co{\colon\thinspace}
\DeclareRobustCommand\dash{%
  \unskip\nobreak\thinspace\textemdash\thinspace\ignorespaces}
\pdfstringdefDisableCommands{\renewcommand{\dash}{ - }}
\newcommand{\extitle}[1]{{\scshape #1}}
\newcommand{\boxquote}[1]{\begin{framed}\small#1\end{framed}}
\newcommand{\notice}[2][Note]{\begin{framed}\noindent\small {\scshape
      #1.}  #2\end{framed}}
\newcommand{\term}[1]{{\scshape #1}\index{#1}}
\newcommand{\expression}[1]{\emph{#1}}
\renewcommand*{\descriptionlabel}[1]{\hspace\labelsep\normalfont\bfseries #1}
\newcommand{\amp}{{\itshape\&}\xspace}
\newcommand{\eex}{{\tiny\ensuremath{\square}}}
\theoremstyle{plain}
\theoremheaderfont{\scshape}
\theorembodyfont{\normalfont}
\theoremseparator{:}
\newtheorem{exercise}{Exercise}[chapter]
\newcommand{\absatz}{\medskip\noindent}
\newcommand{\myfancybreak}{\fancybreak{* * *}}
\providecommand{\sv}[1]{\llbracket #1 \rrbracket}
\providecommand{\svt}[1]{\llbracket \mbox{#1} \rrbracket}
\newcommand{\svwg}[1]{\sv{\text{#1}}^{w,g}}
\providecommand{\svcent}[1]{{\sv{#1}}_{\mbox{\tiny \textcent}}}
\newcommand{\angles}[1]{\ensuremath{\langle #1 \rangle}}
\newcommand{\choice}[1]
  {\ensuremath{\left\{\!\!\begin{array}{l}
     \@for\xx:=#1\do {\text{\xx}\\}
     \\ [-2.75ex]
     \end{array}\!\!\right\}}}
\newcommand{\leftchoice}[1]
  {\ensuremath{\left\{\!\!\begin{array}{l}
     \@for\xx:=#1\do {\text{\xx}\\}
     \\ [-2.75ex]
     \end{array}\right.}}
\def\twodigits#1{\ifnum#1<10 0\fi\the#1} %stolen from hyperref paper
                                         %by Oberdiek
\newcommand{\shorttoday}{\twodigits\month/\twodigits\day/\number\year}
\newcommand{\email}[1]{\href{mailto:#1}{#1}}
%
% Bibliography Settings and Macros
% Should some of the following go in the preamble of the bib-file?
%
\newenvironment{bibentrylist}{%
  \list{}{%
  \setlength{\topsep}{0pt}
  \setlength{\partopsep}{0pt}
  \setlength{\itemsep}{0.5\baselineskip}
  \setlength{\parsep}{0pt}
  \setlength{\leftmargin}{1em}
  \setlength{\rightmargin}{0em}
  \setlength{\listparindent}{1em}
  \setlength{\itemindent}{-1em}
  \setlength{\labelwidth}{0em}
  \setlength{\labelsep}{2em}}}%
  {\endlist}
%
% Settings
%
\tightlists
\urlstyle{rm}
\footmarkstyle{#1\space\space}
\setlength{\footmarkwidth}{0em}
\setlength{\footmarksep}{0em}
\addtolength{\footnotesep}{0.5ex}
\thanksmarkstyle{#1\space\space}
\setlength{\thanksmarkwidth}{0em}
\setlength{\thanksmarksep}{0em}
\addtolength{\footnotesep}{0.5ex}
\maxsecnumdepth{subsection}
%\citeindextrue  % for now, I will leave this out. would need to hack 
% NAT@idx... in a natbib.cfg file to get right format and also would
% need to solve the von-sorting problem for indices, a biggy anyway
%\makeindex
%\onecolindextrue
%
% Memoir settings
% The following defines the page layout. 
%
% A linelength of about 75 characters results, which is considered
% almost optimal.
% 
% I used golden mean for the relation between textwidth and textheight.
%
% I also used the golden mean for the relation between the true upper margin, 
% above the header, and the lower margin. That took some calculation.
%
% Finally, the inner margin is half of the outer margin because this is seen
% as a book. This also leaves plenty of space for margin notes.
\setlength{\textheight}{\paperwidth}
\setlrmargins{*}{*}{1.6182}
\newlength{\wsp} 
\setlength{\wsp}{\paperheight}
\addtolength{\wsp}{-\textheight} 
\addtolength{\wsp}{-\headheight}
\addtolength{\wsp}{-\headsep} 
\newlength{\trueupper}
\setlength{\trueupper}{0.3818\wsp}
\addtolength{\trueupper}{\headheight}
\addtolength{\trueupper}{\headsep}
\setulmargins{\trueupper}{*}{*}
\setmarginnotes{7pt}{102pt}{12pt}
\sideparmargin{outer}
\checkandfixthelayout
% Next come part, chapter, and section title formatting
\setlength{\chapindent}{\marginparsep}
\addtolength{\chapindent}{\marginparwidth}
% The preceding \chapindent defines the furthest right into the margin
% To be used for setting chapter titles, headers, folios, etc.
\renewcommand{\beforepartskip}{\begin{adjustwidth*}%
  {\unitlength}{-\unitlength}\null\vfil}
\renewcommand{\afterpartskip}{\end{adjustwidth*}\vfil\newpage}
\renewcommand{\parttitlefont}{\normalfont\MakeUppercase}
\renewcommand{\partnamefont}{\normalfont\MakeUppercase}
\renewcommand{\partnumfont}{\normalfont\MakeUppercase}
\aliaspagestyle{part}{empty}
\makechapterstyle{lecture}{%
        \setlength{\beforechapskip}{\baselineskip}
        \setlength{\midchapskip}{\baselineskip}
        \setlength{\afterchapskip}{2\baselineskip}
        \renewcommand{\chapnamefont}{\Huge\scshape}
        \renewcommand{\printchapternum}{}
        \renewcommand{\chaptitlefont}{\Huge\scshape}
        \renewcommand{\printchaptername}{%
                \begin{adjustwidth}{}{-\chapindent}
                \raggedleft\caps{\mbox{\chapnamefont \@chapapp}}
                \space \chapnamefont \numtoName{\thechapter}
                \end{adjustwidth}
                }
        \renewcommand{\printchaptertitle}[1]{%
                \begin{adjustwidth}{}{-\chapindent}
                \raggedleft\caps{\mbox{\chaptitlefont ##1}}\par\nobreak
                \end{adjustwidth}
                }
}
\chapterstyle{lecture}
\setsecheadstyle{\bfseries\Large\raggedright}
\setsubsecheadstyle{\bfseries\large\raggedright}
\setsubsubsecheadstyle{\normalsize\scshape\raggedright}
\setbeforesubsubsecskip{-2.25ex plus -1ex minus -.2ex}
\setaftersubsubsecskip{-0.5em} %would make subsubsection run-in
\maxsecnumdepth{subsection}
\setlength{\headwidth}{\textwidth}
%\addtolength{\headwidth}{\chapindent} % Comment to get page number
                                       % flush with text
\newcommand{\headerfont}{\scshape}
\makepagestyle{kaiheadings}
    \makepsmarks{kaiheadings}{%
      \let\@mkboth\markboth
      \def\chaptermark##1{%
        \markboth{%
          ##1 \quad
          \ifnum \c@secnumdepth >\m@ne
            \if@mainmatter
              $\bigl[\mbox{Chapter \thechapter}\bigr.\ $%
            \fi
          \fi
          }{}}%
      \def\tocmark{\markboth{\contentsname}{}}%
      \def\lofmark{\markboth{\MakeUppercase{\listfigurename}}{}}%
      \def\lotmark{\markboth{\MakeUppercase{\listtablename}}{}}%
      \def\bibmark{\markboth{\bibname}{}}%
      \def\indexmark{\markboth{\MakeUppercase{\indexname}}{}}%
      \def\sectionmark##1{%
        \markright{%
          \ifnum \c@secnumdepth > \z@
            $\bigl.\mbox{\S\thesection}\bigr] \ $%
          \fi
          \quad ##1}}%
    }
    
        \makerunningwidth{kaiheadings}{\headwidth}
  
        \makeheadposition{kaiheadings}{flushright}{flushleft}{flushright}{flushleft}
        
        \makeevenhead{kaiheadings}{\thepage}{}{\headerfont\leftmark}
    \makeoddhead{kaiheadings}{\headerfont\rightmark}{}{\thepage}
%    \makeevenfoot{kaiheadings}{\headerfont Page \thepage}{}{\version}
    \makeevenfoot{kaiheadings}{}{}{}
%    \makeoddfoot{kaiheadings}{\version}{}{\headerfont Page \thepage}
    \makeoddfoot{kaiheadings}{}{}{}
\makepagestyle{kaichapter}
        \makerunningwidth{kaichapter}{\headwidth}

        \makeheadposition{kaichapter}{flushright}{flushleft}{flushright}{flushleft}
        
        \makeevenhead{kaichapter}{}{}{}
    \makeoddhead{kaichapter}{}{}{}
    \makeevenfoot{kaichapter}{}{}{}
%    \makeoddfoot{kaichapter}{\version}{}{\headerfont Page \thepage}
    \makeoddfoot{kaichapter}{}{}{}
\aliaspagestyle{chapter}{kaichapter}
\renewcommand{\cleardoublepage}{\clearpage\if@twoside \ifodd\c@page\else
\hbox{}\vfill{\scshape\caps{ --- This page intentionally left blank ---}}\vfill\hbox{}\thispagestyle{cleared}%
  \newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}
  \renewcommand{\cleartorecto}{\clearpage\if@twoside \ifodd\c@page\else
  \hbox{}\vfill{\scshape\caps{--- This page intentionally left blank ---}}\vfill\hbox{}\thispagestyle{cleared}%
  \newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}
\pagestyle{kaiheadings}
\newlength{\mylength}
\calccentering{\mylength}
\newcommand{\ba}{\begin{adjustwidth*}{\mylength}{-\mylength}}
\newcommand{\ab}{\end{adjustwidth*}}
\newcommand{\subtitle}[1]{%
        \gdef\stiT{\huge{#1}}
}
\newcommand{\stiT}{}
\newcommand{\coverimage}[1]{%
  \gdef\coverPIC{\includegraphics[width=\textwidth]{#1}}}
\newcommand{\coverPIC}{}
\pretitle{\ba\begin{center}\Huge\scshape}
\posttitle{%
        \par\vskip 0.25em\stiT
        \par\vskip\onelineskip
        \par\vskip 36pt
        \coverPIC
        \end{center} 
        \ab\vskip 1.5em
}
\preauthor{\vfill\ba\begin{center}\Large\scshape
    \lineskip .5em%
    \begin{tabular}[t]{c}}
\postauthor{\end{tabular}\par\end{center}\ab}
\predate{\vskip\onelineskip\ba\begin{center}\large\scshape}
\postdate{\par\end{center}\ab}
\aliaspagestyle{title}{empty}
\renewcommand{\figurename}{Figure}
% \captionnamefont{\tiny}
% \captiontitlefont{\tiny}
\captionstyle{\centering}
\newcommand\figcaption{\def\@captype{figure}\caption}
% ToC Formatting
\renewcommand{\mtctitle}{}
\renewcommand{\cftpartleader}{} 
\renewcommand{\cftpartafterpnum}{\cftparfillskip} 
\renewcommand{\cftchapterleader}{} 
\renewcommand{\cftchapterafterpnum}{\cftparfillskip} 
\renewcommand{\cftsectionleader}{} 
\renewcommand{\cftsectionafterpnum}{\cftparfillskip} 
\renewcommand{\cftsubsectionleader}{} 
\renewcommand{\cftsubsectionafterpnum}{\cftparfillskip}
% Marginnotes
\newcommand{\marginnote}[1]{\marginpar[\tiny\RaggedRight%
  #1]{\tiny\RaggedLeft #1}}
\newcommand{\margincite}[2][{.}]{\marginnote{\bibentry{#2}#1}}
% Sidepars
\renewcommand{\sideparfont}{\tiny}
\renewcommand{\sideparform}{%
     \ifmemtortm\RaggedLeft\else\RaggedRight\fi}

% Chapter Precis
\renewcommand{\prechapterprecis}{% 
%  \vspace*{-2\baselineskip}% 
\begin{quote}\normalfont\itshape} 
\renewcommand{\postchapterprecis}{\vspace*{\baselineskip}\end{quote}}
% Bufferpage
\newcommand{\bufferpage}{\newpage\hbox{}\vfill{\scshape\caps{--- This page
      intentionally left blank
      ---}}\vfill\hbox{}\thispagestyle{cleared}}

% Strong widow and orphan control

\clubpenalty10000
\widowpenalty10000

% French Spacing

\frenchspacing

% Macros

\newcommand{\type}[1]{\ensuremath{\angles{#1}}}

\let\bibentry\fullcite 
\graphicspath{ {./Images/} }