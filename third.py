faturamento = []
i = 1

# Filtrando apenas os dias com faturamento maior que zero
faturamento_validos = [fatura for fatura in faturamento if fatura > 0]

# Inicializando as variáveis de menor e maior valor
if faturamento_validos:
    menor_valor = faturamento_validos[0]
    maior_valor = faturamento_validos[0]

    # Encontrando o maior e menor valor de faturamento
    for fatura in faturamento_validos:
        if fatura > maior_valor:
            maior_valor = fatura
        if fatura < menor_valor:
            menor_valor = fatura

    # Calculando a média anual de faturamento considerando apenas dias válidos
    media_anual = sum(faturamento_validos) / len(faturamento_validos)

    # Contando o número de dias com faturamento acima da média
    dias_acima_da_media = 0
    for fatura in faturamento_validos:
        if fatura > media_anual:
            dias_acima_da_media += 1

    # Exibindo os resultados
    print(f"Menor valor de faturamento: {menor_valor}")
    print(f"Maior valor de faturamento: {maior_valor}")
    print(
        f"Número de dias com faturamento superior à média anual: {dias_acima_da_media}"
    )
else:
    print("Nenhum dia com faturamento foi registrado.")
