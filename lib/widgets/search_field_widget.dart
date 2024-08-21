import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchBoxWidget extends StatefulWidget {
  final TextEditingController searchController;
  const SearchBoxWidget({
    required this.searchController,
    super.key,
  });

  @override
  State<SearchBoxWidget> createState() => _SearchBoxWidgetState();
}

class _SearchBoxWidgetState extends State<SearchBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          controller: widget.searchController,
          decoration: InputDecoration(
            fillColor: Theme.of(context).cardColor,
            border: InputBorder.none,
            hintText: AppLocalizations.of(context)!.search_field,
            prefixIcon: const Icon(
              Icons.search_rounded,
            ),
            suffix: SizedBox(
              width: 105,
              child: Row(
                children: [
                  const Text(
                    '|',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.keyboard_voice_outlined,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.sort),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    widget.searchController.dispose();
    super.dispose();
  }
}
