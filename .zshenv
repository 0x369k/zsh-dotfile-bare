#################################################################
#                        .zshenv                                #
#################################################################
# What goes in i                                                #
#   Befehlssuchpfad                                             #
#   Andere wichtige Umgebungsvariablen                          #
#   Befehle zum Einrichten von Aliassen und Funktionen, die     #
#   für andere Skripte benötigt werden                          #
#################################################################
# What does NOT go in it                                        # 
#   Befehle, die eine Ausgabe erzeugen                          #
#   Alles, was die Shell voraussetzt, wird an ein tty angehängt # 
#################################################################

###############################
# EXPORT ENVIRONMENT VARIABLE #
###############################

# XDG
export XDG_CONFIG_HOME="$HOME/.config"      #  Wo benutzerspezifische Konfigurationen geschrieben werden sollen (analog zu /etc
export XDG_CACHE_HOME="$HOME/.cache"        #  Wo benutzerspezifische nicht wesentliche (gecachte) Daten geschrieben werden sollen (analog zu /var/cache). 
#export XDG_DATA_HOME="$HOME/.local/share"  #  Wo benutzerspezifische Datendateien geschrieben werden sollen (analog zu /usr/share). 
#export XDG_STATE_HOME="$HOME/.local/state" #  Wo benutzerspezifische Zustandsdateien geschrieben werden sollen (analog zu /var/lib). 
#export XDG_RUNTIME_DIR="/run/user/$UID"    #  Wird für nicht wesentliche, benutzerspezifische Datendateien wie Sockets, Named Pipes usw. verwendet.
                                            #  Kein Standardwert erforderlich; Warnungen sollten ausgegeben werden, wenn sie nicht gesetzt sind, oder Äquivalente bereitgestellt werden.
                                            #  Muss dem Benutzer mit einem Zugriffsmodus von gehören 0700.
                                            #  Dateisystem, das nach den Standards des Betriebssystems vollständig ausgestattet ist.
                                            #  Muss sich auf dem lokalen Dateisystem befinden.
                                            #  Kann regelmäßig gereinigt werden.
                                            #  Alle 6 Stunden geändert oder Sticky Bit gesetzt, wenn Persistenz gewünscht wird.
                                            #  Kann nur für die Dauer der Anmeldung des Benutzers bestehen.
                                            #  Sollte keine großen Dateien speichern, da sie möglicherweise als tmpfs gemountet werden.
                                            #  pam_systemd setzt dies auf /run/user/$UID. 

skip_global_compinit=1

export ZDOTDIR="$HOME/.zsh"
[[ -f $ZDOTDIR/.zshrc ]] && . $ZDOTDIR/.zshrc

declare -A ZI
export ZI[HOME_DIR]="$HOME/.zsh/.zi"
export ZI[COMPLETIONS_DIR]="$ZI[HOME_DIR]/completions"	#Completion working directory
export ZI[CACHE_DIR]="$HOME/.cache/zi"					#Cache directory
export ZI[CONFIG_DIR]="$HOME/.config/zi"				#Directory for configuration files
export ZI[MAN_DIR]="$ZPFX/man"							#Directory to store manpages
export ZI[LOG_DIR]="$ZI[CACHE_DIR]/log"					#Directory to store log files
export ZI[PLUGINS_DIR]="$ZI[HOME_DIR]/plugins"			#Plugins working directory
export ZI[SNIPPETS_DIR]="$ZI[HOME_DIR]/snippets"		#Snippets working directory
export ZI[ZCOMPDUMP_PATH]="${ZI[CACHE_DIR]}/.zcompdump"	#Path to .zcompdump file
export ZI[ZMODULES_DIR]="$ZI[HOME_DIR]/zmodules"		#Zsh modules working directory
export ZPFX="$ZI[HOME_DIR]/polaris"						#Directory to store binary and related files


