package wikiquery;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.jena.query.Query;
import org.apache.jena.query.QueryFactory;

public class QueryParser {

	public static String remove_Service(String query) {

		//Query jenaquery = QueryFactory.create(query);

		String regex = "SERVICE\\s?([^\\{\\}]+)\\{([^\\{\\}]+)\\}";
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(query);

		String newquery = query;

		int index = 0;

		while (matcher.find(index)) {
			String wholething = matcher.group();

			String newString = "#" + wholething.trim().replace("\n", "\n#");

			newquery = query.replace(wholething, newString);

			index = matcher.end();
		}

		

		return newquery;

	}

	public static void main(String[] args) {
		
		String filename = "./Wikidata.html";
		String output_folder = "./output";
		String org_folder = output_folder + "/" + "orginal/";
		String update_folder = output_folder + "/" + "updated/";
		
		File dir = new File(org_folder);
		dir.mkdirs();
		dir = new File(update_folder);
		dir.mkdirs();
		

		String prefixes = "PREFIX bd: <http://www.bigdata.com/rdf#>\r\n"
				+ "PREFIX cc: <http://creativecommons.org/ns#>\r\n" + "PREFIX dct: <http://purl.org/dc/terms/>\r\n"
				+ "PREFIX geo: <http://www.opengis.net/ont/geosparql#>\r\n"
				+ "PREFIX ontolex: <http://www.w3.org/ns/lemon/ontolex#>\r\n"
				+ "PREFIX owl: <http://www.w3.org/2002/07/owl#>\r\n" + "PREFIX p: <http://www.wikidata.org/prop/>\r\n"
				+ "PREFIX pq: <http://www.wikidata.org/prop/qualifier/>\r\n"
				+ "PREFIX pqn: <http://www.wikidata.org/prop/qualifier/value-normalized/>\r\n"
				+ "PREFIX pqv: <http://www.wikidata.org/prop/qualifier/value/>\r\n"
				+ "PREFIX pr: <http://www.wikidata.org/prop/reference/>\r\n"
				+ "PREFIX prn: <http://www.wikidata.org/prop/reference/value-normalized/>\r\n"
				+ "PREFIX prov: <http://www.w3.org/ns/prov#>\r\n"
				+ "PREFIX prv: <http://www.wikidata.org/prop/reference/value/>\r\n"
				+ "PREFIX ps: <http://www.wikidata.org/prop/statement/>\r\n"
				+ "PREFIX psn: <http://www.wikidata.org/prop/statement/value-normalized/>\r\n"
				+ "PREFIX psv: <http://www.wikidata.org/prop/statement/value/>\r\n"
				+ "PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>\r\n"
				+ "PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>\r\n" + "PREFIX schema: <http://schema.org/>\r\n"
				+ "PREFIX skos: <http://www.w3.org/2004/02/skos/core#>\r\n"
				+ "PREFIX wd: <http://www.wikidata.org/entity/>\r\n"
				+ "PREFIX wdata: <http://www.wikidata.org/wiki/Special:EntityData/>\r\n"
				+ "PREFIX wdno: <http://www.wikidata.org/prop/novalue/>\r\n"
				+ "PREFIX wdref: <http://www.wikidata.org/reference/>\r\n"
				+ "PREFIX wds: <http://www.wikidata.org/entity/statement/>\r\n"
				+ "PREFIX wdt: <http://www.wikidata.org/prop/direct/>\r\n"
				+ "PREFIX wdtn: <http://www.wikidata.org/prop/direct-normalized/>\r\n"
				+ "PREFIX wdv: <http://www.wikidata.org/value/>\r\n"
				+ "PREFIX wikibase: <http://wikiba.se/ontology#>\r\n"
				+ "PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>\r\n"
				+ "PREFIX hint: <http://www.bigdata.com/queryHints#>\r\n"
				+ "PREFIX geof: <http://www.opengis.net/def/geosparql/function/>";

		try {
			String content = Files.readString(Path.of(filename));

			String regex = "<a class=\"external text\" href\\s?=\\s?\"([^\"]+)\">";
			Pattern pattern = Pattern.compile(regex);
			Matcher matcher = pattern.matcher(content);
			int index = 0;
			int count = 1;
			while (matcher.find(index)) {
				String wholething = matcher.group(); // includes "<a href" and ">"
				String link = matcher.group(1); // just the link

				if (link.startsWith("https://query.wikidata.org/#")) {
					String[] query = link.split("https://query.wikidata.org/#");

					String result = query[1];

					String html = java.net.URLDecoder.decode(result, "UTF-8");

					html = prefixes + "\n\n" + html;

					String org_outfile = org_folder + "Query_" + String.format("%03d", count) + ".sparql";
					String update_outfile = update_folder + "Query_" + String.format("%03d", count) + ".sparql";

					// System.out.println(html);
					Files.writeString(Path.of(org_outfile), html);

					try {
						html = remove_Service(html);
					} catch (Exception e) {
						System.out.println(update_outfile);
						System.out.println(e.toString());
					}

					Files.writeString(Path.of(update_outfile), html);

					count++;
				}

				index = matcher.end();

			}

		} catch (IOException e) {
			
			e.printStackTrace();
		}

	}

}
