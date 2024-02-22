package modelo;

import java.util.HashMap;
import java.util.Map;

public class Pix {

    public static String generatePixPayload(String chavePix, String descricao, double valor, String nomeBeneficiado, String cidadeBeneficiado) {
        Map<String, String> dataObjects = new HashMap<>();

        // Payload Format Indicator
        dataObjects.put("00", "01");

        // Merchant Account Information
        String merchantAccountInfo = "26" + "00" + "14" + "BR.GOV.BCB.PIX" + "01" + "11"+ chavePix;
        dataObjects.put("26", merchantAccountInfo);

        // Merchant Category Code
        String merchantCategoryCode = "04" + "0000" + "14";
        dataObjects.put("52", merchantCategoryCode);

        // Transaction Currency
        dataObjects.put("53", "986");

        // Transaction Amount
        String transactionAmount = String.format("%015d", (long) (valor * 100)); // Valor em centavos
        dataObjects.put("54", transactionAmount);

        // Country Code
        dataObjects.put("58", "BR");

        // Merchant Name
        dataObjects.put("59", nomeBeneficiado);

        // Merchant City
        dataObjects.put("60", cidadeBeneficiado);

        // Additional Data Field Template
        String additionalDataFieldTemplate = "62070503***"; // Campos adicionais específicos do arranjo
        dataObjects.put("62", additionalDataFieldTemplate);

        // CRC (Cyclic Redundancy Check)
        String crc = calculateCRC(dataObjects);
        dataObjects.put("63", crc);

        // Construir o payload
        StringBuilder payloadBuilder = new StringBuilder();
        for (Map.Entry<String, String> entry : dataObjects.entrySet()) {
            String id = entry.getKey();
            String value = entry.getValue();
            payloadBuilder.append(id).append(String.format("%02d", value.length())).append(value);
        }

        return payloadBuilder.toString();
    }

    private static String calculateCRC(Map<String, String> dataObjects) {
        StringBuilder concatData = new StringBuilder();

        // Concatena os dados para cálculo do CRC
        for (Map.Entry<String, String> entry : dataObjects.entrySet()) {
            concatData.append(entry.getKey()).append(entry.getValue());
        }

        byte[] dataBytes = concatData.toString().getBytes();

        int crc = 0xFFFF; // Inicializa o CRC com 0xFFFF

        for (int i = 0; i < dataBytes.length; i++) {
            crc ^= (int) dataBytes[i] & 0xFF;

            for (int j = 0; j < 8; j++) {
                if ((crc & 0x0001) != 0) {
                    crc >>= 1;
                    crc ^= 0x8408; // Padrão polinomial para CRC16
                } else {
                    crc >>= 1;
                }
            }
        }

        // Converte o valor CRC para uma string hexadecimal de 4 dígitos
        return String.format("%04X", crc);
    }
}
