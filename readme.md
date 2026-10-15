# TechAssist — Banco de Dados Relacional

Projeto acadêmico de banco de dados relacional desenvolvido para uma empresa fictícia de assistência técnica em TI. O sistema tem como objetivo organizar informações sobre clientes, equipamentos, técnicos, serviços e peças, facilitando o gerenciamento dos atendimentos.

## Sobre o projeto

A TechAssist é uma empresa fictícia especializada em manutenção e reparo de equipamentos de informática. Para organizar suas atividades, foi proposto um banco de dados relacional capaz de armazenar informações e relacionar os principais dados da empresa.

O projeto apresenta a modelagem das tabelas, conceitos de normalização e consultas SQL para obter informações úteis sobre os serviços realizados.

## Objetivos

- Organizar os dados de clientes e equipamentos.
- Registrar os técnicos responsáveis pelos atendimentos.
- Controlar os serviços de manutenção e seus respectivos status.
- Gerenciar as peças utilizadas nos reparos.
- Aplicar os conceitos de banco de dados relacional e normalização.
- Desenvolver consultas SQL utilizando filtros, relacionamentos e funções de agregação.

## Modelagem do banco de dados

O modelo lógico do projeto é composto por cinco tabelas principais:

| Tabela | Descrição |
|---|---|
| `clientes` | Armazena os dados dos clientes. |
| `equipamentos` | Registra os equipamentos cadastrados. |
| `tecnicos` | Armazena os dados dos profissionais responsáveis pelos serviços. |
| `servicos` | Registra os atendimentos e as informações sobre os reparos. |
| `pecas` | Armazena informações sobre as peças utilizadas nos serviços. |

As tabelas são relacionadas por meio de chaves primárias e estrangeiras, permitindo manter a integridade dos dados e consultar informações de diferentes partes do sistema.

## Tecnologias utilizadas

- **MySQL:** criação e gerenciamento do banco de dados.
- **HTML5:** estruturação da página do projeto.
- **CSS3:** estilização e organização visual da página.
- **SQL:** criação e execução das consultas ao banco de dados.

## Conteúdos abordados

O projeto demonstra conceitos importantes de banco de dados:

- Modelagem lógica de dados.
- Chaves primárias (`PRIMARY KEY`) e estrangeiras (`FOREIGN KEY`).
- Relacionamentos entre tabelas.
- Normalização: 1FN, 2FN, 3FN e 4FN.
- Consultas com `SELECT`, `WHERE` e `ORDER BY`.
- Relacionamentos com `INNER JOIN`.
- Agrupamentos com `GROUP BY` e filtros com `HAVING`.
- Funções de agregação, como `COUNT`, `SUM` e `AVG`, conforme aplicáveis às consultas.

## Consultas SQL

A página apresenta 15 consultas SQL organizadas por categoria, facilitando a leitura e a compreensão dos comandos.

As consultas estão divididas em:

- **Consultas e relacionamentos:** recuperação de informações relacionadas entre as tabelas.
- **Relatórios por técnico:** visualização de dados sobre os profissionais e os serviços.
- **Filtros e situação dos serviços:** busca de atendimentos conforme critérios específicos.
- **Indicadores e agregações:** consultas que utilizam agrupamentos e funções para resumir informações.

## Como visualizar o projeto

1. Faça o download ou clone o repositório.
2. Abra a pasta do projeto.
3. Localize o arquivo `index.html`.
4. Abra-o em um navegador, como Google Chrome ou Microsoft Edge.


## Estrutura do projeto

```text
TechAssist/
├── index.html
├── README.md
└── assets/
    └── css/
        └── main.css
```

---