# Paralegram
Jogo educacional de quebra-cabeças que combina programação visual, raciocínio lógico e conceitos de computação paralela em um ambiente de logística portuária.

Índice

1. Introdução

1.1. Resumo da História

1.2. Visão Geral da Jogabilidade

1.3. Gênero, Semelhanças e Diferenças

1.4. Público-Alvo

1.5. Atrativos do Jogo

1.6. Fluxo do Jogo

2. Interface e Interação

2.1. Entradas

2.2. Saídas

3. Mecânica do Jogo

3.1. Mecânica Básica

3.2. Progressão do Jogo

3.3. Condições de Vitória

4. Detalhamento Técnico

4.1. Hardware

4.2. Software

4.3. Engine

5. Arte e Design

5.1. Resumo do Estilo

5.2. Principais Referências

5.3. Concept Art e Sprites

5.4. HUD

5.5. Efeitos Visuais

5.6. Animações

---

1. Introdução


Este documento apresenta os aspectos técnicos, artísticos e narrativos do jogo Paralegram, incluindo seu enredo, suas mecânicas, seus objetivos, a jogabilidade e as ferramentas utilizadas no desenvolvimento.

Essas informações servem como referência para orientar as etapas de produção e desenvolvimento do jogo.

---

1.1. Resumo da História

O enredo se passa em um centro de expedição portuário, onde o personagem principal precisa gerenciar todas as etapas da operação logística, desde a origem dos produtos no centro de distribuição do fabricante até o carregamento dos contêineres nos navios.

A operação é dividida em quatro etapas:

Classificação: as mercadorias são organizadas no centro de distribuição. O funcionário responsável classifica as caixas conforme seus destinos e as agrupa em paletes.

Transporte: após a separação, os paletes são carregados em caminhões e transportados até o porto.

Organização dos contêineres: no porto, operadores utilizam empilhadeiras para organizar as mercadorias em contêineres, que são lacrados e transportados até o pátio de expedição.

Carregamento dos navios: os contêineres são classificados no pátio conforme seus destinos e carregados nos navios atracados no cais por meio de guindastes portuários.

Durante as operações, o jogador enfrenta desafios de lógica e quebra-cabeças que exigem planejamento estratégico para administrar os recursos, o espaço e o tempo disponíveis.

---

1.2. Visão Geral da Jogabilidade

A jogabilidade é inspirada em jogos de tabuleiro e quebra-cabeças. O jogador precisa resolver os desafios apresentados em cada fase descrevendo os movimentos dos personagens e equipamentos por meio de um editor de programação visual baseado em blocos.

O jogador organiza os blocos de instruções para criar uma sequência de comandos que será executada pelo personagem no cenário.

Referência do editor de código em blocos:

!Editor de código em blocos

A dinâmica das fases é baseada na resolução de missões. O jogador utiliza as informações adquiridas durante a partida para encontrar soluções eficientes para os desafios propostos.

A interface de quebra-cabeças tem como referência o jogo Dungeon Class.

!Referência de interface do Dungeon Class

Exemplo de interface de quebra-cabeças inspirado em Dungeon Class.

---

1.3. Gênero, Semelhanças e Diferenças

Paralegram é um jogo do gênero puzzle, com perspectiva top-down (visão de cima), ambientado em um centro de distribuição e em instalações portuárias.

A direção visual utiliza pixel art para representar personagens, equipamentos e cenários. Entre as referências visuais estão jogos clássicos como The Legend of Zelda: A Link to the Past.

!Referência visual de The Legend of Zelda: A Link to the Past

Referência de perspectiva e jogabilidade top-down.

O jogo combina exploração de cenários, interação com objetos e resolução de problemas com programação visual e conceitos de computação paralela.

---

1.4. Público-Alvo

O jogo é destinado a um público amplo, desde adolescentes até adultos, incluindo pessoas que não jogam videogames regularmente.

O público prioritário são estudantes de graduação que estejam cursando disciplinas relacionadas à programação paralela. Entretanto, o jogo não se limita a esse grupo.

Personas

**Persona 1 — Thiago**

Idade: 28 anos

Ocupação: estudante do Ensino Médio

Plataformas preferidas: PC, PlayStation 5, Nintendo DS e Super Nintendo

Jogos favoritos: Donkey Kong 1, 2 e 3

Objetivos: competir, relaxar e alcançar rankings

Comportamentos: prefere experiências desafiadoras

Frustrações: interfaces confusas

**Persona 2 — Jonas**

Idade: 32 anos

Ocupação: estudante do Ensino Médio

Plataformas preferidas: PC, dispositivos móveis e emuladores

Jogos favoritos: GTA San Andreas, GTA V, Forza Horizon e Dragon Ball

Objetivos: relaxar e dominar habilidades

Comportamentos:

Busca desafios constantes.

Prefere partidas ranqueadas.

Também aprecia experiências tranquilas.

Joga em sessões curtas.

Frustrações: pressão excessiva por competitividade

**Persona 3 — Ulissis**

Idade: 23 anos

Ocupação: estudante do Ensino Médio

Plataformas preferidas: PC, Super Nintendo, Xbox Series X/S e dispositivos móveis

Jogos favoritos: FC Mobile e Dragon Ball Budokai

Objetivos: relaxar, alcançar rankings e personalizar elementos do jogo

Comportamentos:

Busca desafios constantes.

Valoriza a precisão dos controles.

Gosta de desbloquear itens cosméticos.

Frustrações:

Bugs que prejudicam o desempenho.

Tutoriais muito longos.

Controles imprecisos.

**Persona 4 — Nielton**

Idade: 42 anos

Ocupação: estudante do Ensino Médio

Plataformas preferidas: Mega Drive, Steam Deck, Web e Nintendo Switch

Jogos favoritos: Super Metroid e Zelda para SNES

Objetivos: relaxar, superar desafios e testar reflexos

Comportamentos: mantém uma postura amigável e tranquila durante as partidas

Frustrações: toxicidade entre jogadores, especialmente em jogos MMO

---

1.5. Atrativos do Jogo

O principal atrativo de Paralegram é ensinar conceitos de computação paralela de forma lúdica, por meio de atividades interativas que incentivam o aprendizado.

O jogo busca desenvolver:

Raciocínio lógico: resolução de quebra-cabeças e elaboração de sequências de instruções.

Planejamento estratégico: escolha de comandos e utilização eficiente dos recursos disponíveis.

Pensamento computacional: decomposição de problemas em tarefas menores e organização de instruções.

Conceitos de paralelismo: compreensão de como diferentes equipamentos podem executar tarefas simultaneamente.

Eficiência: comparação entre soluções que utilizam diferentes quantidades de comandos, recursos e tempo.

A aplicação prática da metodologia PCAM também integra a proposta educacional do jogo, auxiliando o jogador a compreender conceitos relacionados à programação paralela.

---

1.6. Fluxo do Jogo

A progressão ocorre conforme o jogador conclui as missões de cada fase. A resolução dos quebra-cabeças concede pontos que podem ser utilizados para desbloquear novos desafios até a etapa final.

**Fase 1 — Particionamento**

!Fase 1 — Classificação

**Fase 2 — Comunicação**

!Fase 2 — Transporte

**Fase 3 — Aglomeração**

!Fase 3 — Agrupamento

**Fase 4 — Mapeamento**

!Fase 4 — Carregar

---

2. Interface e Interação

Esta seção descreve os dispositivos de entrada e saída utilizados pelo jogador durante a execução do jogo.

---

2.1. Entradas

O jogo utiliza teclado e mouse como dispositivos de entrada.

O teclado permite navegar pelos menus e interagir com campos de texto. O mouse é utilizado principalmente para interagir com os elementos da interface e organizar os blocos de instruções no editor visual.

---

2.1.1. Teclado

O teclado permite selecionar opções dos menus e inserir informações nos campos de texto.

Para orientar os comandos de navegação, são considerados os seguintes eixos:

Eixo X: direção horizontal.

Eixo Y: direção vertical.

---

2.1.2. Mouse

O mouse permite interagir com os quebra-cabeças por meio do editor de código em blocos.

O jogador pode:

Arrastar blocos de comandos para a área de edição.

Organizar a sequência de instruções.

Pressionar o botão de execução para executar e avaliar os comandos.

Utilizar o botão Limpar para remover os blocos da área de edição e começar novamente.

---

2.2. Saídas

As saídas do jogo são realizadas por meio de:

Vídeo: monitor ou tela compatível.

Áudio: caixas de som ou fones de ouvido.

---

2.2.1. Telas

As telas do jogo são organizadas em estados, nos quais cada estado representa uma cena ou interface apresentada ao jogador. As transições entre as telas são determinadas pelos eventos e pelas ações executadas durante a partida.

!Diagrama de fluxo das telas do jogo

---

2.2.2. Menus

O menu inicial apresenta as principais opções de navegação.

!Menu inicial

As opções disponíveis são:

Tutorial: apresenta informações para auxiliar o jogador a compreender a interface e as mecânicas.

Iniciar Jogo: inicia o processo de uma nova partida. Informações adicionais podem ser solicitadas antes do início efetivo do jogo.

Ao selecionar Tutorial, o jogador acessa uma tela com instruções sobre o editor de código em blocos e as principais interações disponíveis.

!Menu de tutorial

---

3. Mecânica do Jogo

Esta seção descreve o comportamento dos personagens, dos blocos de código e dos elementos do cenário.

---

3.1. Mecânica Básica

A mecânica principal consiste em posicionar blocos de código no editor visual para definir os movimentos que o personagem ou equipamento deverá executar no cenário.

Após organizar os comandos, o jogador pressiona o botão de execução. O jogo interpreta a sequência de instruções e executa as ações programadas para resolver o desafio da fase.

A pontuação depende da eficiência da solução: quanto melhor o jogador otimizar a sequência de comandos e os recursos utilizados, maior poderá ser a recompensa obtida ao final da fase.

---

3.1.1. Mecânica dos Personagens

Cada etapa apresenta personagens e equipamentos específicos, de acordo com a operação logística representada.

Fase 1: operadores do centro de distribuição transportam caixas manualmente até os paletes.

Fase 2: os operadores utilizam empilhadeiras para movimentar os paletes e carregar os caminhões.

Fase 3: no pátio portuário, equipamentos especializados movimentam e organizam os contêineres conforme seus destinos.

Fase 4: o jogador controla operações de guindastes portuários para transportar os contêineres até os navios.

---

3.1.2. Ações dos Personagens

Os blocos de instruções disponíveis variam conforme o personagem ou equipamento controlado.

Operador: virar à esquerda, virar à direita, andar para frente e andar para trás.

Empilhadeira: virar à esquerda, virar à direita, mover para frente e comunicar.

Empilhadeira portuária: mover para cima, para baixo, para a direita e para a esquerda; pegar ou soltar objetos.

Guincho portuário: pegar contêiner, soltar contêiner, ir ao navio e ir ao pátio.

---

3.1.3. Pontuação

Cada fase pode conceder de uma a três estrelas, conforme o desempenho do jogador.

Cada estrela vale 100 pontos, totalizando até 300 pontos por fase.

⭐ 1 estrela: 100 pontos.

⭐⭐ 2 estrelas: 200 pontos.

⭐⭐⭐ 3 estrelas: 300 pontos.

O objetivo é incentivar o jogador a buscar soluções mais eficientes. A conclusão do desafio com uma sequência menos otimizada pode resultar em uma pontuação menor, enquanto uma solução mais eficiente pode conceder a pontuação máxima.

!Tela de pontuação ao final da fase

---

3.1.4. Temporizador

Na quarta fase, o jogador deve executar uma sequência de tarefas no menor tempo possível para carregar o navio atracado no porto.

O temporizador permite observar o tempo de execução das operações e comparar estratégias com diferentes quantidades de guinchos. Dessa forma, o jogador pode explorar, na prática, os efeitos da execução paralela sobre o desempenho da tarefa.

!Cronômetro do jogo

---

3.2. Progressão do Jogo

A dificuldade aumenta progressivamente ao longo das fases. Os primeiros desafios introduzem as mecânicas básicas, enquanto as etapas seguintes exigem maior planejamento, organização e eficiência.

Na terceira e na quarta fases, os desafios de organização e agrupamento exigem que o jogador identifique padrões de cores, organize os objetos e planeje os movimentos dos equipamentos.

---

3.2.1. Dificuldade das Fases

**Fase 1 — Classificação**

O centro de distribuição possui mercadorias embaladas, identificadas por cores que representam seus destinos.

O jogador deve organizar as caixas em paletes de acordo com suas cores para que possam ser carregadas corretamente nos caminhões. Inicialmente, as caixas estão desorganizadas no galpão, exigindo que o operador planeje e execute os movimentos necessários.

**Fase 2 — Transporte**

Após a classificação das mercadorias, o jogador deve estabelecer uma sequência de ações e comunicações entre as empilhadeiras para que cada carga seja alocada no caminhão correto.

O planejamento deve evitar congestionamentos, colisões entre os equipamentos e erros na destinação dos produtos.

**Fase 3 — Organização dos contêineres**

Com os produtos acondicionados em contêineres, os caminhões os transportam até o pátio portuário.

O jogador deve utilizar a empilhadeira de contêineres para organizar as cargas em pilhas conforme seus destinos, planejando os movimentos para evitar comandos desnecessários e reduzir o tempo de execução.

**Fase 4 — Carregamento do navio**

O navio está atracado no porto e aguarda o carregamento. Os contêineres são transportados do pátio até os guindastes portuários, que realizam o içamento e a movimentação das cargas para o navio.

O jogador deve organizar os contêineres conforme a ordem de carregamento e considerar suas cores e seus destinos. Para concluir a tarefa, poderá utilizar um ou vários guinchos, de acordo com as possibilidades oferecidas pelo desafio.

Essa etapa explora a execução paralela de tarefas por diferentes guinchos, permitindo comparar o desempenho de soluções com diferentes configurações de recursos.

---

3.3. Condições de Vitória

Para avançar de fase, o jogador deve concluir o desafio proposto.

Na última fase, o objetivo é carregar o navio utilizando os guinchos disponíveis e buscando a configuração mais eficiente possível para concluir a operação.

---

4. Detalhamento Técnico

Esta seção apresenta os requisitos de hardware e as ferramentas consideradas para o desenvolvimento e a execução do jogo.

---

4.1. Hardware

Os requisitos de hardware e sistema operacional especificados para o projeto são:

Sistema operacional: Windows 10 ou superior; Linux com Wine 9.0.

Processador: 2 GHz, arquitetura x86-64.

Memória RAM: mínimo de 4 GB.

Armazenamento: 20 MB de espaço disponível.

Monitor: resolução mínima de 1024 × 768, com 32 bits de cores.

Dispositivos de entrada: teclado e mouse.

Observação: os requisitos acima refletem as especificações documentadas para o projeto e não necessariamente representam requisitos validados da versão atual do jogo.

---

4.2. Software

As ferramentas utilizadas ou avaliadas durante o desenvolvimento incluem:

PyGame

!Logotipo do PyGame

Biblioteca utilizada na criação de protótipos e na experimentação de mecânicas de jogo com Python.

GameMaker Studio

!Logotipo do GameMaker Studio

Ambiente de desenvolvimento considerado para a implementação do jogo, incluindo a criação de cenários 2D, animações e interfaces.

---

4.3. Engine

Como o projeto estabelece como requisito a utilização de gráficos bidimensionais (2D), foram estudadas alternativas de engine para atender às necessidades de desenvolvimento.

O GameMaker Studio foi escolhido para a versão final do jogo por oferecer funcionalidades voltadas à criação de jogos 2D e facilitar a implementação de cenários, animações e interfaces, incluindo o editor visual de comandos.

Durante o desenvolvimento, também foram criados protótipos utilizando PyGame. Essa biblioteca destacou-se pela facilidade de aprendizado e pelo suporte à linguagem Python.

Na versão final planejada, a lógica do jogo utiliza a linguagem de script do GameMaker Studio, enquanto o ambiente oferece recursos para a construção da interface e das mecânicas.

---

5. Arte e Design

Esta seção apresenta as principais referências artísticas e os elementos visuais planejados para o jogo.

---

5.1. Resumo do Estilo

O estilo visual combina formas estilizadas, elementos inspirados em objetos reais e características de desenho animado (cartoon).

As texturas utilizam cores fortes e contrastantes. Os componentes gráficos são desenvolvidos em pixel art, buscando uma identidade visual consistente entre personagens, equipamentos e cenários.

---

5.2. Principais Referências

O desenvolvimento visual do jogo utiliza referências de jogos que apresentam perspectivas, interfaces ou mecânicas semelhantes às propostas para Paralegram.

Dungeon Class

!Referência de Dungeon Class

Referência para a organização da interface e a apresentação dos desafios de quebra-cabeças.

Game Blockly

!Referência de Game Blockly

Referência para a utilização de programação visual e blocos de instruções.

The Legend of Zelda: A Link to the Past

!Referência de The Legend of Zelda: A Link to the Past

Referência para a perspectiva top-down e a apresentação visual dos cenários.

---

5.3. Concept Art e Sprites

Esta seção apresenta referências visuais para personagens, máquinas, edifícios e outros elementos utilizados na composição do jogo.

---

5.3.1. Personagens

Os personagens são inspirados em trabalhadores humanos, equipamentos de centros de distribuição e maquinário portuário.

O projeto contempla operadores do centro de distribuição e operadores portuários, representados de acordo com as funções desempenhadas em cada fase.

Operadores do centro de distribuição

!Operadores do centro de distribuição

Operadores portuários

!Operadores portuários

---

5.3.2. Cenários

Os cenários são desenvolvidos conforme as características das etapas logísticas representadas em cada fase.

**Fase 1 — Particionamento**

!Cenário da fase 1 — Classificação

**Fase 2 — Comunicação**

!Cenário da fase 2 — Transporte

**Fase 3 — Aglomeração**

!Cenário da fase 3 — Agrupamento

**Fase 4 — Mapeamento**

!Cenário da fase 4 — Carregamento

---

5.3.3. Personagens Principais

Os personagens principais são representados em pixel art e incluem operadores portuários equipados com os recursos necessários para desempenhar as funções controladas pelo jogador.

A imagem abaixo apresenta a referência utilizada na construção visual desses personagens.

!Referência dos personagens principais

---

5.3.4. Objetos

Os objetos utilizados variam de acordo com as necessidades de cada fase.

Fase 1: caixas e paletes.

Fase 2: caixas, paletes, paletes com caixas, empilhadeiras e caminhões.

Fase 3: contêineres, empilhadeiras de contêineres e caminhões com contêineres.

Fase 4: contêineres, guinchos, caminhões e caminhões com contêineres.

---

5.3.5. Mensagens de Ajuda

As mensagens de ajuda têm como objetivo esclarecer as tarefas de cada fase.

Os textos devem apresentar os objetivos de forma clara, orientar o jogador sobre as interações disponíveis e incentivá-lo a explorar o cenário para encontrar soluções eficientes.

---

5.3.6. Editor de Código

O editor de código é a principal interface para a elaboração das soluções dos desafios.

A área de edição apresenta os blocos de instruções disponíveis em um campo cinza-escuro e a área de montagem do código em um campo cinza-claro. O jogador arrasta os blocos para a área de edição, formando a sequência de comandos que será executada.

Os principais controles são:

Executar: inicia a execução da sequência de instruções.

Limpar: remove os blocos da área de edição.

Ajuda: abre o menu de tutoriais, com instruções em texto e animações explicativas.

O código montado na área de edição é executado conforme a ordem definida pela interface. A especificação original descreve essa ordem como de cima para baixo e da direita para a esquerda.

!Editor de código em blocos

---

5.4. HUD (Heads-Up Display)

O HUD reúne informações importantes para o acompanhamento do desempenho durante a partida.

Pontuação

!Indicador de pontos

Apresenta a quantidade de pontos acumulados nas fases concluídas.

Temporizador

!Indicador de tempo

Apresenta o tempo, em minutos e segundos, utilizado na execução da sequência de comandos.

---

5.5. Efeitos Visuais

O jogo contempla efeitos visuais destinados a tornar as ações e os movimentos mais claros e dinâmicos.

Entre os efeitos previstos estão:

Borramento de movimento (Motion Blur): aplicado durante determinados movimentos para reforçar a percepção de deslocamento.

Animações de cenário: movimentos de personagens secundários, empilhadeiras, guinchos e outros elementos das fases.

---

5.6. Animações

O jogo utiliza animações para representar os movimentos dos personagens e equipamentos durante as partidas, além de transições entre fases e apresentações dos resultados no painel de pontuação.

Os personagens possuem animações de caminhada e movimentação no cenário. Empilhadeiras, equipamentos portuários e outros elementos também podem apresentar animações para representar suas ações.

As animações e os comportamentos dos personagens e equipamentos são desenvolvidos no ambiente GameMaker Studio, utilizando os recursos disponíveis na engine.
