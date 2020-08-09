# This file started life as:
# https://github.com/microsoft/vscode-dev-containers/blob/v0.101.1/containers/ubuntu-18.04-git/.devcontainer/Dockerfile
# as the basic Ubuntu+git VSCode remote container.
FROM jedibart/latexlilypond:0.2.0

# This Dockerfile adds a non-root user with sudo access. Use the "remoteUser"
# property in devcontainer.json to use it. On Linux, the container user's GID/UIDs
# will be updated to match your local UID/GID (when using the dockerFile property).
# See https://aka.ms/vscode-remote/containers/non-root-user for details.
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Set to false to skip installing zsh and Oh My ZSH!
ARG INSTALL_ZSH="false"

# Location and expected SHA for common setup script - SHA generated on release
ARG COMMON_SCRIPT_SOURCE="https://raw.githubusercontent.com/microsoft/vscode-dev-containers/master/script-library/common-debian.sh"
ARG COMMON_SCRIPT_SHA="dev-mode"

# CTAN mirrors occasionally fail, in that case install TexLive against an
# specific server, for example http://ctan.crest.fr
#
# # docker build \
#     --build-arg TEXLIVE_MIRROR=http://ctan.crest.fr/tex-archive/systems/texlive/tlnet
ARG TEXLIVE_MIRROR=http://mirror.ctan.org/systems/texlive/tlnet

# Avoid warnings by switching to noninteractive
ENV DEBIAN_FRONTEND=noninteractive

# Verify git, common tools / libs installed, add/modify non-root user, optionally install zsh
RUN apt-get update \
    && apt-get -y install --no-install-recommends \
      git \
    && wget -q -O /tmp/common-setup.sh $COMMON_SCRIPT_SOURCE \
    && if [ "$COMMON_SCRIPT_SHA" != "dev-mode" ]; then echo "$COMMON_SCRIPT_SHA /tmp/common-setup.sh" | sha256sum -c - ; fi \
    && /bin/bash /tmp/common-setup.sh "$INSTALL_ZSH" "$USERNAME" "$USER_UID" "$USER_GID" \
    && rm /tmp/common-setup.sh

# Switch back to dialog for any ad-hoc use of apt-get
ENV DEBIAN_FRONTEND=dialog

# Install extensions as a layer.
# Look up what texlive package to install to get specific latex packages
# at https://ctan.org/
# (search for the LaTeX package and add the "contained in TeXLive as __")
RUN tlmgr install --repository ${TEXLIVE_MIRROR} \
    # Packages that aren't self-named ( see https://ctan.org/)
      # graphicsx contained in TeXLive as graphics
      graphics \
      # tikz - in TeXLive as pgf
      pgf \
      # multicol, verbatim in TeXLive as tools
      tools \
    # Self-named packages
      enumitem \
      fancyhdr \
      geometry \
      needspace \
      titlepic \
      titlesec \
      xargs \
    \
&&  rm -rf /install-tl-unx

# This is needed to get the locales to work out properly.
CMD ["/usr/bin/supervisord". "-n"]