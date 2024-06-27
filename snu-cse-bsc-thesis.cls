%%
%% This is file `snu-cse-bsc-thesis.cls'.
%%
%% -----------------------------------------------------------------
%% The snu-cse-bsc-thesis class --- A class for SNU CSE BSc theses
%% Maintained by Jay Lee
%% E-mail: jaeho.lee@snu.ac.kr
%% Released under the MIT License.
%% -----------------------------------------------------------------
%%
\NeedsTeXFormat{LaTeX2e}[2022-06-01]
\RequirePackage{expl3}
\ProvidesExplClass
  {snu-cse-bsc-thesis}
  {2024/06/27}
  {0.1}
  {A class for SNU CSE BSc theses}


%%%%%%%%%%%%%%%%%%%%%%%%%
% Options for the class %
%%%%%%%%%%%%%%%%%%%%%%%%%
\DeclareKeys {
  en .code = { \bool_set_true:N \l_snu_cse_bsc_thesis_en_bool },
  ko .code = { \bool_set_false:N \l_snu_cse_bsc_thesis_en_bool },
}
\SetKeys { ko }
\ProcessKeyOptions


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% XeLaTeX or LuaLaTeX required %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{iftex}
\ifXeTeX\else\ifLuaTeX\else
  \ClassError {snu-cse-bsc-thesis}
    { This~class~only~supports~XeLaTeX~and~LuaLaTeX. }
    { Please~use~either~XeLaTeX~or~LuaLaTeX. }
\fi\fi


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Language-specific settings %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\tl_const:Nn \l_snu_cse_bsc_thesis_abstractname_ko { 국문초록 }
\tl_const:Nn \l_snu_cse_bsc_thesis_contentsname_ko { 목~차 }
\tl_const:Nn \l_snu_cse_bsc_thesis_listtablename_ko { 표~목차 }
\tl_const:Nn \l_snu_cse_bsc_thesis_listfigurename_ko { 그림~목차 }
\tl_const:Nn \l_snu_cse_bsc_thesis_bibname_ko { 참~고~문~헌 }
\tl_const:Nn \l_snu_cse_bsc_thesis_abstractname_en { Abstract }
\tl_const:Nn \l_snu_cse_bsc_thesis_contentsname_en { Contents }
\tl_const:Nn \l_snu_cse_bsc_thesis_listtablename_en { List~of~Tables }
\tl_const:Nn \l_snu_cse_bsc_thesis_listfigurename_en { List~of~Figures }
\tl_const:Nn \l_snu_cse_bsc_thesis_bibname_en { References }

\bool_if:NTF \l_snu_cse_bsc_thesis_en_bool
  { % English main
    \LoadClass[11pt, a4paper]{report}
    \RequirePackage{kotex}


    \RequirePackage[doublespacing]{setspace}
    \RequirePackage{caption}
    % If the setspace is used in conjuction with the caption package, the caption
    % will be typeset with single spacing as default.
    \captionsetup[table]{font=onehalfspacing}
    \captionsetup[figure]{font=onehalfspacing}

    \let\abstractname\l_snu_cse_bsc_thesis_abstractname_en
    \let\contentsname\l_snu_cse_bsc_thesis_contentsname_en
    \let\listtablename\l_snu_cse_bsc_thesis_listtablename_en
    \let\listfigurename\l_snu_cse_bsc_thesis_listfigurename_en
    \AddToHook {begindocument/before} {
      \let\oldprintbibliography\printbibliography
      \renewcommand{\printbibliography}{
        \oldprintbibliography[title=\l_snu_cse_bsc_thesis_bibname_en]
      }
    }
  }
  { % Korean main
    \LoadClass[10pt, a4paper]{report}
    \RequirePackage[hangul]{kotex}

    \RequirePackage[doublespacing]{setspace}
    \RequirePackage[
      list=off,
      bi-separator=smallskip,
      font=onehalfspacing
    ]{bicaption}
    \bicaptionsetup[table]{name=표}{name=Table}
    \bicaptionsetup[figure]{name=그림}{name=Figure}

    \let\abstractname\l_snu_cse_bsc_thesis_abstractname_ko
    \let\contentsname\l_snu_cse_bsc_thesis_contentsname_ko
    \let\listtablename\l_snu_cse_bsc_thesis_listtablename_ko
    \let\listfigurename\l_snu_cse_bsc_thesis_listfigurename_ko
    \AddToHook {begindocument/before} {
      \let\oldprintbibliography\printbibliography
      \renewcommand{\printbibliography}{
        \oldprintbibliography[title=\l_snu_cse_bsc_thesis_bibname_ko]
      }
    }
  }


%%%%%%%%%%%%%%%%%%%%%%%%
% Package dependencies %
%%%%%%%%%%%%%%%%%%%%%%%%
% Subfigures
\RequirePackage{subcaption}

% Images
\RequirePackage{graphicx}

% Tables
\RequirePackage{tabularray}
\UseTblrLibrary{booktabs}

% Math
\RequirePackage{amssymb,amsmath,mathtools} % Before unicode-math
% \RequirePackage[math-style=TeX,bold-style=TeX]{unicode-math}

\RequirePackage{xcolor}

% Chapter style
\RequirePackage{titlesec}

% Bibliography
\RequirePackage[style=ieee]{biblatex}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Page layout configuration %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\addtolength{\hoffset}{-1in}
\addtolength{\voffset}{-1in}
\setlength{\topmargin}{30mm}
\setlength{\headheight}{0mm}
\setlength{\headsep}{0mm}
\setlength{\marginparwidth}{0mm}
\setlength{\marginparsep}{0mm}
\setlength{\oddsidemargin}{25mm}
\setlength{\textwidth}{160mm}
\setlength{\textheight}{227mm}
\setlength{\footskip}{20mm}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Chapter / section style configuration %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\titleformat{\chapter}
  { \centering\normalfont\fontsize{16pt}{19pt}\selectfont\bfseries }
  { 제\hspace{.2em}\thechapter\hspace{.2em}장 }
  { .6em }
  { }

\renewcommand{\thesection}{\arabic{section}}
\titleformat{\section}
  { \normalfont\fontsize{14pt}{16pt}\selectfont\bfseries }
  { 제\hspace{.2em}\thesection\hspace{.2em}절 }
  { .6em }
  { }


%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Document metadata fields %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\clist_new:N \l_snu_cse_bsc_thesis_keywords_ko_clist
\clist_new:N \l_snu_cse_bsc_thesis_keywords_en_clist

\NewDocumentCommand \titlealt { m }
  { \newcommand*\@titlealt{#1} }

\newcommand\authorspaced{
  \tl_map_inline:Nn { \@author } { ##1~ }
}

\NewDocumentCommand \advisor { m }
  { \newcommand*\@advisor{#1} }
\NewDocumentCommand \approvaldate { m }
  { \newcommand*\@approvaldate{#1} }
\NewDocumentCommand \koreankeywords { m }
  {
    \clist_set:Nn \l_snu_cse_bsc_thesis_keywords_ko_clist { #1 }
  }
\NewDocumentCommand \englishkeywords { m }
  {
    \clist_set:Nn \l_snu_cse_bsc_thesis_keywords_en_clist { #1 }
  }

% https://github.com/latex3/hyperref/issues/242#issuecomment-1149845979
\AddToHook {begindocument/before} {
  \hypersetup{
    colorlinks,
    linkcolor={black},
    citecolor={red!73!black},
    urlcolor={blue!60!black},

    pdflang = { \bool_if:NTF \l_snu_cse_bsc_thesis_en_bool { en } { ko } },
    pdfsubject = {공학~학사~학위논문},
    pdfkeywords = {
      \clist_use:Nnnn \l_snu_cse_bsc_thesis_keywords_en_clist { , } { , } { , },
      \clist_use:Nnnn \l_snu_cse_bsc_thesis_keywords_ko_clist { , } { , } { , }
    },
  }
}

% Redefine \maketitle
\AtBeginDocument {
  % hyperref package redefines \@maketitle
  \def\HyOrg@maketitle{
    \newpage
    \null

    % 외표지
    \thispagestyle{empty}
    \begin{center}
      \fontsize{24pt}{28pt}\selectfont
      \@title \\
      \fontsize{18pt}{21pt}\selectfont
      (\@titlealt) \\
      \vfill
      \fontsize{18pt}{21pt}\selectfont
      지도교수~:~\@advisor \\
      \vfill
      \fontsize{20pt}{23pt}\selectfont
      이~논문을~공학학사~학위~논문으로~제출함. \\
      \vfill
      \fontsize{18pt}{21pt}\selectfont
      \@date \\
      \vfill
      \fontsize{20pt}{23pt}\selectfont
      서울대학교~공과대학 \\
      컴~퓨~터~공~학~부 \\
      \authorspaced \\
      \vfill
      \@approvaldate \\
    \end{center}
    \newpage

    % 인준지
    \thispagestyle{empty}
    \begin{center}
      \fontsize{24pt}{28pt}\selectfont
      \@title \\
      \fontsize{18pt}{21pt}\selectfont
      (\@titlealt) \\
      \vfill
      \fontsize{18pt}{21pt}\selectfont
      지도교수~:~\@advisor \\
      \vfill
      \fontsize{20pt}{23pt}\selectfont
      이~논문을~공학학사~학위~논문으로~제출함. \\
      \vfill
      \fontsize{18pt}{21pt}\selectfont
      \@date \\
      \vfill
      \fontsize{20pt}{23pt}\selectfont
      서울대학교~공과대학 \\
      컴~퓨~터~공~학~부 \\
      \authorspaced \\
      \vfill
      \@approvaldate \\
    \end{center}
    \newpage
  }
}

% Redefine \baselinestretch for ToCs
\let\@starttoc@orig\@starttoc
\def\@starttoc#1{
  \begin{onehalfspace}
    \@starttoc@orig{#1}
  \end{onehalfspace}
}

\cs_generate_variant:Nn \text_purify:n {V}

\RenewDocumentEnvironment { abstract } { o }
  {
    \IfValueTF { #1 }
      {
        \tl_if_eq:nnTF { #1 } { ko }
          { % Korean abstract
            \chapter*{\l_snu_cse_bsc_thesis_abstractname_ko}
            \addcontentsline{toc}{chapter}
              {\text_purify:V\l_snu_cse_bsc_thesis_abstractname_ko}
          }
          {
            \tl_if_eq:nnTF { #1 } { en }
              { % English abstract
                \chapter*{\l_snu_cse_bsc_thesis_abstractname_en}
                \addcontentsline{toc}{chapter}
                  {\text_purify:V\l_snu_cse_bsc_thesis_abstractname_en}
              }
              { % Unrecognized language
                \ClassError { snu-cse-bsc-thesis }
                  { Unrecognized~language:~`#1' }
                  { Please~use~either~`ko'~or~`en' }

                \chapter*{\abstractname}
                \addcontentsline{toc}{chapter}{\abstractname}
              }
          }
      }
      { % No language specified
        \chapter*{\abstractname}
        \addcontentsline{toc}{chapter}{\abstractname}
      }
  }
  {
    \vfill
    \IfValueTF { #1 }
      {
        \tl_if_eq:nnTF { #1 } { ko }
          { % Korean abstract
            \noindent 주요어: \clist_use:Nnnn \l_snu_cse_bsc_thesis_keywords_ko_clist { ,~ } { ,~ } { ,~ }
          }
          {
            \tl_if_eq:nnTF { #1 } { en }
              { % English abstract
              \noindent Keywords:~\clist_use:Nnnn \l_snu_cse_bsc_thesis_keywords_en_clist { ,~ } { ,~ } { ,~ }
              }
              { % Unrecognized language
                \noindent 주요어:~\clist_use:Nnnn \l_snu_cse_bsc_thesis_keywords_ko_clist { ,~ } { ,~ } { ,~ }
              }
          }
      }
      { % No language specified
        \bool_if:NTF \l_snu_cse_bsc_thesis_en_bool
          { % English main
            \noindent Keywords:~\clist_use:Nnnn
              \l_snu_cse_bsc_thesis_keywords_en_clist { ,~ } { ,~ } { ,~ }
          }
          { % Korean main
            \noindent 주요어:~\clist_use:Nnnn
              \l_snu_cse_bsc_thesis_keywords_ko_clist { ,~ } { ,~ } { ,~ }
          }
      }
  }
