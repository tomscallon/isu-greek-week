CREATE TABLE teams(
  chapter    VARCHAR(20) PRIMARY KEY,
  team_name  VARCHAR(20) NOT NULL
);

-- Adding all the teams to the teams table
INSERT INTO teams VALUES ('Kappa Kappa Gamma', '3rd Termz the Charm'), ('Delta Tau Delta', '3rd Termz the Charm'), ('Phi Beta Chi', '3rd Termz the Charm'), ('Delta Zeta', 'ACDZ'), ('Sigma Chi', 'ACDZ'), ('Adelante', 'ACDZ'), ('Alpha Kappa Lambda', 'ACDZ'), ('Kappa Alpha Theta', 'GREEKLINE BLING'), ('Pi Kappa Alpha', 'GREEKLINE BLING'), ('Theta Chi', 'GREEKLINE BLING'), ('Alpha Gamma Delta', 'G.I. Greeks'), ('Alpha Gamma Rho', 'G.I. Greeks'), ('Phi Kappa Theta', 'G.I. Greeks'), ('Alpha Sigma Kappa', 'G.I. Greeks'), ('Kappa Delta', 'Kappa Phi Delta Chi'), ('Phi Delta Theta', 'Kappa Phi Delta Chi'), ('Delta Chi', 'Kappa Phi Delta Chi'), ('Delta Delta Delta', 'Quad Squad'), ('Phi Kappa Psi', 'Quad Squad'), ('Triangle', 'Quad Squad'), ('Chi Phi', 'Quad Squad'), ('Alpha Delta Pi', 'Scream Team'), ('Sigma Pi', 'Scream Team'), ('Delta Lambda Phi', 'Scream Team'), ('Alpha Chi Omega', 'The Greek Awakens'), ('Alpha Tau Omega', 'The Greek Awakens'), ('Beta Sigma Psi', 'The Greek Awakens'), ('Gamma Phi Beta', 'The Olympians'), ('Phi Gamma Delta', 'The Olympians'), ('Delta Sigma Psi', 'The Olympians'), ('Gamma Rho Lambda', 'The Olympians'), ('Alpha Omicron Pi', 'The Omicron Empire'), ('FarmHouse', 'The Omicron Empire'), ('Kappa Sigma', 'The Omicron Empire'), ('Sigma Kappa', 'The SKuad'), ('Tau Kappa Epsilon', 'The SKuad'), ('Theta Delta Chi', 'The SKuad'), ('Chi Omega', 'The Young Pharaohs'), ('Delta Upsilon', 'The Young Pharaohs'), ('Lambda Chi Alpha', 'The Young Pharaohs'), ('Pi Beta Phi', 'TriPhis'), ('Alpha Sigma Phi', 'TriPhis'), ('Pi Kappa Phi', 'TriPhis'), ('Alpha Phi', 'USAΦ'), ('Sigma Phi Epsilon', 'USAΦ'), ('ACACIA', 'USAΦ');

CREATE TABLE event_roster(
  id          CHAR(20) PRIMARY KEY,
  isu_id      VARCHAR(9) NOT NULL,
  net_id      VARCHAR(20) NOT NULL,
  first_name  VARCHAR(20) NOT NULL,
  last_name   VARCHAR(20) NOT NULL,
  chapter     VARCHAR(20) NOT NULL REFERENCES teams(chapter),
  w_lipsync   BOOLEAN NOT NULL DEFAULT false, -- true if this person has filled out a lipsync waiver
  w_general   BOOLEAN NOT NULL DEFAULT false, -- true if this person has filled out a general waiver
  technical   BOOLEAN NOT NULL DEFAULT false, -- true if this person has received a technical foul in a tournament (this prohibits him or her from participating in other tournaments)
  events      TEXT[] NOT NULL DEFAULT Array[]::TEXT[] -- array of events this person has checked in to
);